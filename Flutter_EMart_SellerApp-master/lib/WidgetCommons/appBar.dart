import 'package:emart_seller/const/const.dart';

import 'NormalText.dart';
import "package:intl/intl.dart" as intl;

AppBar appBarPersonal(title){
  return  AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: white,
    elevation: 0,
    title: boldText(
      text: title,
      size: 20.0,
      color: fontGrey,
    ),
    actions: [
      Center(
        child: normalText(
          text: intl.DateFormat.yMMMMd('en_US').format(DateTime.now()),
          color: fontGrey,
          size: 16.0,
        ),

      ),
      10.widthBox,
    ],
  );
}