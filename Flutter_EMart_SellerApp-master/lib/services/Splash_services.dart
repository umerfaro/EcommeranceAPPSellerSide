
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/Home/Home.dart';
import '../views/auth_screen/login_screen.dart';
import 'Session manager.dart';


class SplashServices {
  Future<void> isLogin(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final user = auth.currentUser;

      if (user != null) {

        SessionController().userId = user.uid.toString();
        await Future.delayed(const Duration(seconds: 3));
        if(context.mounted)
        {
          SessionController().userId = user.uid.toString();
          Get.offAll(() => const Home());
        }
      }
      else {
        await Future.delayed(const Duration(seconds: 3));
        if(context.mounted) {
          Get.offAll(() => const LoginScreen());
        }
      }
    } catch (e) {
      // Handle any authentication exceptions here
      if (kDebugMode) {
        print('Authentication error: $e');
      }
      // You might want to navigate to an error screen or show a message to the user
    }
  }
}