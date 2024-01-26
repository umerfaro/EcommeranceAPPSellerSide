import "package:emart_seller/WidgetCommons/NormalText.dart";
import "package:emart_seller/const/const.dart";


Widget orderPlaced({required String title1,required String title2, detail1, detail2}){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            boldText(
                text: title1,
                size:16.0,
                color: purpleColor),
            10.heightBox,
            boldText(
                text: detail1,
                color: red),

          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldText(
                    text: title2,
                    size:16.0,
                    color: purpleColor),
                10.heightBox,
                boldText(
                    text: detail2,
                    color: fontGrey),

              ]
          ),
        )

      ],
    ),
  );
}