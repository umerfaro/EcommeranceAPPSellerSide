import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/TextFileCustom2.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/message/Compoents/productImages.dart';
import 'package:get/get.dart';

import '../../Controller/product_Controller.dart';
import '../../Utils/Utils.dart';
import '../../WidgetCommons/LoadingIndicator.dart';
import 'components/productDropdown.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {

    var controller= Get.find<ProductController>();
    return  SafeArea(
      
      child: Obx(
        ()=> Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            title: boldText(
              text: "Add Product",
              size: 16.0,
              color: fontGrey,


            ),
            actions: [

        controller.isLoading.value? loadingIndicator():
              TextButton(
                onPressed: () async {
                  controller.isLoading.value=true;
                  await controller.uploadImages();
                  await controller.uploadProduct();
                  Get.back();

                },
                child: const Icon(Icons.save,color: fontGrey,),

              ),
              10.widthBox,
            ],

          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controller.productFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  customTextFormField(
                    title: productname,
                    hint: productnameHint,
                    isPassword: false,
                    context: context,
                     controller: controller.pnameController,
                     myFocusNode: controller.pnameFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.pnameFocusNode,
                        controller.pdecFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your Product Name' : null;
                    },
                  ),
                  customTextFormField2(
                    title: productDes,
                    hint: productDesHint,
                    context: context,
                    controller: controller.pdecController,
                     myFocusNode: controller.pdecFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.pdecFocusNode,
                        controller.pPriceFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your Some Product Description' : null;
                    },
                  ),
                  customTextFormField(
                    title: productPrice,
                    hint: productPriceHint,
                    isPassword: false,
                    context: context,
                     controller: controller.pPriceController,
                     myFocusNode: controller.pPriceFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.pPriceFocusNode,
                        controller.pQuntityFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your Product Price' : null;
                    },
                  ),

                  customTextFormField(
                    title: productQuantity,
                    hint: productQuantityHint,
                    isPassword: false,
                    context: context,
                     controller: controller.pQuntityController,
                    myFocusNode: controller.pQuntityFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.pQuntityFocusNode,
                        controller.pQuntityFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your Product Quantity' : null;
                    },
                  ),
                  10.heightBox ,
                  productDropdown(
                    "Category",
                    controller.categoryList,
                    controller.categoryvalue,
                      controller

                  ),
                  10.heightBox ,
                  productDropdown(
                    "subCategory",
                    controller.subcategoryList,
                    controller.subCategoryvalue,
                    controller
                  ),
                  const Divider(),
                  10.heightBox ,
                  boldText(
                    text: productImage,
                    color: fontGrey,
                  ),
                  10.heightBox ,
                  Obx(
                    ()=> Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children:List.generate(3, (index) =>
                          controller.pImagesList[index]!=null?Image.file(controller.pImagesList[index]
                          ,width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ).onTap(() {
                            controller.picImages(index, context);


                          }) :
                          productImages(
                        lable: "${index+1}").onTap(() {
                        controller.picImages(index, context);
                        })
                      ),
                    ),
                  ),
                  10.heightBox ,
                  normalText(
                    text: "First Image will be your main image",
                    color: fontGrey,
                  ),

                  const Divider(),
                  10.heightBox ,
                  boldText(
                    text: "Choose product Colors",
                    color: fontGrey,
                  ),
                  10.heightBox ,
                  Obx(
                    ()=> Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: List.generate(9,(index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          VxBox().color(Vx.randomPrimaryColor).roundedFull.size(50,50).make().onTap(() {
                            controller.selectedColorIndex.value=index;
                          }),
                          controller.selectedColorIndex.value== index?
                          const Icon(Icons.done,color: white,):const SizedBox()
                        ],
                      )
                      ),
                    ),
                  )





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
