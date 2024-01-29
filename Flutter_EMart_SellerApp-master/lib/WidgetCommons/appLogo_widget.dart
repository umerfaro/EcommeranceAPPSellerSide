import "package:emart_seller/const/const.dart";


//
Widget appLogoWidget(){

  //using velocity_x package
  return   Image.asset(
      icMetaLogo
  ).box.white.size(77, 77).padding( const EdgeInsets.all(8)).rounded.make();
}