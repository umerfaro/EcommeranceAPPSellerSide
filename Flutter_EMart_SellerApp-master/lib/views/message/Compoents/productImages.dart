import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';

Widget productImages({required lable,onpress}){
  return lable.toString().text.bold.size(16).color(fontGrey).makeCentered().box.color(lightGrey).size(100,100).roundedSM.make().onTap(onpress);
}