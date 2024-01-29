
import 'package:emart_seller/const/colors.dart';
import 'package:emart_seller/const/const.dart';
import 'package:flutter/material.dart';


import '../../WidgetCommons/appLogo_widget.dart';
import '../../services/Splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  SplashServices splashServices = SplashServices();


  @override
  void initState() {
    splashServices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Hero(
                tag: 'splash_image', // Unique tag for the image
                child: Image.asset(icSplashBg, width: 300),
              ),
            ),
            20.heightBox,
            Hero(
              tag: 'app_logo', // Unique tag for the app logo
              child: appLogoWidget(),
            ),
            10.heightBox,
            const Text(
              appname,
              style: TextStyle(
                color: white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
