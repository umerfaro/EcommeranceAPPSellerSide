import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/Orders/order_Details.dart';
import 'package:get/get.dart';
import "package:intl/intl.dart" as intl;
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  white,
      appBar: appBarPersonal(orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) =>    ListTile(
          
              onTap: (){
                 Get.to(()=> OrderDetails());
              },
              tileColor: textfieldGrey,
              
              title: boldText(
                text: "Code",
                size: 16.0,
                color: purpleColor,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                   children: [
                     Icon(Icons.calendar_month,color: fontGrey,),
                     10.widthBox,
                     boldText(
                       text: intl.DateFormat().add_yMd().format(DateTime.now()),
                       size: 12.0,
                       color: fontGrey,
                     ),
                   ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.payment,color: fontGrey,),
                      10.widthBox,
                      boldText(
                        text: "unpaid",
                        size: 12.0,
                        color: red,
                      ),
                    ],
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              trailing: normalText(
                text: "Rs. 100",
                size: 14.0,
                color: purpleColor,
              ),
            ).box.margin(EdgeInsets.only(bottom: 4)).make()
            ),
          
          ),
        ),
      ),
    );
  }
}
