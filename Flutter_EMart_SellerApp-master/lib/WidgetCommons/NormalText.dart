import "package:emart_seller/const/const.dart";

Widget normalText({text,color=Colors.white, family,size=14.0}){

  return "$text".text.color(color).size(size).make();
}

Widget boldText({text,color=Colors.white, family,size=14.0}){

  return "$text".text.color(color).fontFamily(semibold).size(size).make();
}