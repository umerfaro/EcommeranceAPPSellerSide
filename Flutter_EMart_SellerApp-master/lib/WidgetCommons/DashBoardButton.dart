
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';

Widget dashBoardButton(context, {title,count,icon}  )
{
  var size= MediaQuery.sizeOf(context);
  return     Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            boldText(
              text:title,
              size: 16.0
              ,                   ),
            boldText(
              text:count,
              size: 16.0
              ,                   )
          ],
        ),
      ),
      Image.asset(icon,
        width: 40,
        color: white,
      )

    ],
  ).box.color(purpleColor).rounded.size(size.width* 0.4,80).padding(EdgeInsets.all(8)).make();
}