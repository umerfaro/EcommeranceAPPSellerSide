
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import'package:emart_seller/const/const.dart';

import '../Services/Session manager.dart';
import '../Utils/Utils.dart';
import '../views/Home/Home.dart';

class AuthController extends  GetxController{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  // Form key
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  Map<String, int> emailLoginAttempts = {};

  final RxBool loginButtonEnable = false.obs;
  void resetLoginState() {
    loginButtonEnable.value = false;
  }

  Future<UserCredential?> loginMethod() async {
    try {
      loginButtonEnable.value = true;

      // Check if there are too many login attempts for this email
      if ((emailLoginAttempts[emailController.text] ?? 0) >= 3) {
        loginButtonEnable.value = false;
        Utils.toastMessage("Too many login attempts. Your account is temporarily blocked.");
        return null;
      }

      final userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Reset login attempts for this email on successful login
      emailLoginAttempts[emailController.text] = 0;

      SessionController().userId = userCredential.user!.uid;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Increment login attempts for this email
      emailLoginAttempts[emailController.text] = (emailLoginAttempts[emailController.text] ?? 0) + 1;

      // Check if there are too many login attempts for this email
      if ((emailLoginAttempts[emailController.text] ?? 0) >= 3) {
        loginButtonEnable.value = false;
        Utils.toastMessage("Too many login attempts. Your account is temporarily blocked.");
        return null;
      }

      Utils.toastMessage(_handleLoginError(e));
      loginButtonEnable.value = false;
    } finally {
      loginButtonEnable.value = false;
    }
    return null;
  }

//   void Login(data, BuildContext context) {
//     loginButtonEnable.value = true;
//     auth
//         .signInWithEmailAndPassword(
//         email: data["email"], password: data["password"])
//         .then((value) {
// //calling singleton class
//       SessionController().userId= value.user!.uid.toString();
//       loginButtonEnable.value = false;
//       Utils.toastMessage("Login Successfully");
//       Get.offAll(() => const Home());
//     }
//     ).onError((error, stackTrace) {
//       loginButtonEnable.value = false;
//       Utils.flushBarErrorMessage(error.toString(), context);
//     });
//   }



  Future<void> signOutMethod() async {
    try {
      await auth.signOut();
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  String _handleLoginError(FirebaseAuthException e) {
    // Log the error code for debugging purposes
    if (kDebugMode) {
      print("Firebase Authentication Error Code: ${e.code}");
    }

    switch (e.code) {
      case 'too-many-requests':
        return 'Too many login attempts. Your account is temporarily blocked.';
      case 'user-not-found':
        return 'No user found for that email';
      case 'wrong-password':
        return 'Wrong password provided for that user';
      default:
        return e.message ?? 'An error occurred during login';
    }
  }


}