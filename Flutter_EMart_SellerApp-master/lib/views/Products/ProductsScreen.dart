import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:emart_seller/views/Products/addProduct.dart';
import 'package:get/get.dart';

import '../../Controller/product_Controller.dart';
import '../../WidgetCommons/NormalText.dart';
import 'ProductDetails.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller= Get.put(ProductController());
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {

        await   controller.getCategories();
           controller.populateCategoriesList();
          Get.to(()=> const AddProduct());


        },
        child: const Icon(Icons.add,color: white,),
      ),
      backgroundColor:  white,
      appBar: appBarPersonal(products),
      body: StreamBuilder(
        stream: StoreServices.getProducts(SessionController().userId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>  snapshot){

    if (!snapshot.hasData) {
    return Center(
    child: loadingIndicator(),
    );
    } else if (snapshot.data!.docs.isEmpty) {
    return const Center(
    child: Text("No Orders Yet!"),
    );
    } else {
      var data= snapshot.data!.docs;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(data.length, (index) =>    ListTile(

              onTap: (){
                Get.to(()=> ProductDetails(
                  data: data[index],
                ));
              },
              leading: Image.network(data[index]['p_images'][0],width: 100,height: 100,fit: BoxFit.cover,
              ),
              title: boldText(
                text: data[index]['p_name'].toString(),
                size: 16.0,
                color: darkGrey,
              ),
              subtitle: Row(
                children: [
                  boldText(
                    text: data[index]['p_price'].toString().numCurrency,
                    color: darkGrey,
                  ),
                  10.widthBox,
                  boldText(
                    text: data[index]['is_featured']?   "Featured":"",
                    color: green,
                  )
                ],

              ),
              trailing: VxPopupMenu(
                menuBuilder: ()=>Column(
                  children: List.generate(popUpMenuIcons.length, (index) => Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(

                      children: [
                        Icon(popUpMenuIcons[index],color: fontGrey,),
                        10.widthBox,
                        normalText(
                          text: popUpMenuTitles[index],
                          size: 12.0,
                          color: fontGrey,
                        ),
                      ],
                    ).onTap(() {

                    }),
                  )),
                ).box.white.rounded.shadowMd.width(200).make(),
                clickType: VxClickType.singleClick,
                child: const Icon(Icons.more_vert,color: fontGrey,),
              ),
            )),
          ),
        ),
      );

    }



      },
      ),
    );
  }
}
