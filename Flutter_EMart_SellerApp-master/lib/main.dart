import 'package:emart_seller/const/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'const/styles.dart';
import 'views/auth_screen/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: darkFontGrey),
            backgroundColor: Colors.transparent,
          ),
          fontFamily: regular
      ),
      home: const LoginScreen(),
    );
  }
}
