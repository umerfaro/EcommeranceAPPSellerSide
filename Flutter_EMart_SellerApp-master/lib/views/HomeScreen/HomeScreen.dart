import 'package:emart_seller/WidgetCommons/DashBoardButton.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import "package:intl/intl.dart" as intl;
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  white,
      appBar: appBarPersonal(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           dashBoardButton(context,title:products,count: "10",
           icon: icProducts,
           ),
           dashBoardButton(context,title:orders,count: "15",
           icon: icOrders,
           ),
         ],
       ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,title:rating,count: "10",
                icon: icStar,
                ),
                dashBoardButton(context,title:totalSales,count: "15"
                ,icon: icOrders,
                ),
              ],
            ),
            10.heightBox,
            Divider(),
            10.heightBox,
            boldText(
              text: popularProducts,
              size: 18.0,
              color: fontGrey,
            ),
            ListView(
 physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(3, (index) =>
                  ListTile(
                onTap: (){
                //  Get.toNamed(productDetails);
                },
                leading: Image.asset(imgProduct,width: 100,height: 100,fit: BoxFit.cover,),
               title: boldText(
                 text: "Product Name",
                 size: 16.0,
                 color: darkGrey,
               ),
                subtitle: normalText(
                  text: "Product Description",
                  size: 12.0,
                  color: fontGrey,
                ),
                trailing: normalText(
                  text: "Rs. 100",
                  size: 14.0,
                  color: darkGrey,
                ),
              )),
            )



          ],
        ),
      ),
    );
  }
}
