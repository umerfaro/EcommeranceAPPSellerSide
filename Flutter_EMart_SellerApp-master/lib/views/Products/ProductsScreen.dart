import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/Products/addProduct.dart';
import 'package:get/get.dart';

import '../../WidgetCommons/NormalText.dart';
import 'ProductDetails.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: (){

          Get.to(()=> AddProduct());
          // Get.toNamed(addProduct);
        },
        child: Icon(Icons.add,color: white,),
      ),
      backgroundColor:  white,
      appBar: appBarPersonal(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) =>    ListTile(

              onTap: (){
                 Get.to(()=> ProductDetails());
              },
              leading: Image.asset(imgProduct,width: 100,height: 100,fit: BoxFit.cover,),
              title: boldText(
                text: "Product Name",
                size: 16.0,
                color: darkGrey,
              ),
              subtitle: Row(
                children: [
                    boldText(
                    text: "Rs. 1000",
                    color: darkGrey,
                  ),
                  10.widthBox,
                  boldText(
                    text: "Featured",
                    color: green,
                  )
                ],

              ),
              trailing: VxPopupMenu(
                child: Icon(Icons.more_vert,color: fontGrey,),
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
              ),
            )),
          ),
        ),
      ),
    );
  }
}
