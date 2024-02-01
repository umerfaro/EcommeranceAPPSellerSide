import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Controller/HomeController.dart';
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:emart_seller/WidgetCommons/DashBoardButton.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:get/get.dart';

import '../../WidgetCommons/LoadingIndicator.dart';
import '../Products/ProductDetails.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor:  white,
      appBar: appBarPersonal(dashboard),
      body: StreamBuilder(
        stream:StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>  snapshot){

    if (!snapshot.hasData) {
    return Center(
    child: loadingIndicator(),
    );
    }
    else if (snapshot.data!.docs.isEmpty)
    {
    return const Center(
    child: Text("No Popular Orders Yet!"),
    );
    } else {
         var data= snapshot.data!.docs;
         //sorted
         data= data.sortedBy((a, b) => b['p_wishList'].length.compareTo(a['p_wishList'].length));

         return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,title:products,count: data.length.toString(),
                  icon: icProducts,
                ),
                dashBoardButton(context,title:orders,count: controller.orderCount.toString(),

                  icon: icOrders,

                ),
              ],
            ),

            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,title:rating,count: controller.rating.toString(),
                  icon: icStar,
                ),
                dashBoardButton(context,title:totalSales,count: controller.totalSales.toString()
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
              children: List.generate(
                  data.length, (index) =>

              data[index]['p_wishList'].length==0?const SizedBox():
                  ListTile(
                    onTap: (){
                       Get.to(()=> ProductDetails(
                         data: data[index],
                       ));
                    },

                    leading: CachedNetworkImage(
                      imageUrl:  data[index]['p_images'][0],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: loadingIndicator(),
                      ),
                    ),


                    title: boldText(
                      text: data[index]['p_name'].toString(),
                      size: 16.0,
                      color: darkGrey,
                    ),

                    subtitle: normalText(
                      text: data[index]['p_price'].toString().numCurrency,
                      size: 14.0,
                      color: darkGrey,
                    ),
                  )),
            )



          ],
        ),
      );
    }


        },
      )
    );
  }
}
