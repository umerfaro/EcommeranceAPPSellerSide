
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/FireBase_const.dart';
import '../views/Home/Home.dart';
import '../views/auth_screen/login_screen.dart';
import 'Session manager.dart';

class SplashServices
{
  Future<void> isLogin(BuildContext context) async {

    try {


      if (currentUser != null)
      {

        SessionController().userId = currentUser!.uid.toString();
        await Future.delayed(const Duration(seconds: 3));
        if(context.mounted)
          {
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
