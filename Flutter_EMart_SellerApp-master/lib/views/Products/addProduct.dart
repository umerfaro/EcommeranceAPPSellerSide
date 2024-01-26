import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/TextFileCustom2.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/message/Compoents/productImages.dart';

import 'components/productDropdown.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: boldText(
            text: "Add Product",
            size: 16.0,
            color: fontGrey,
      
      
          ),
          actions: [
      
            TextButton(
              onPressed: (){
                // Get.toNamed(editProfile);
              },
              child: const Icon(Icons.save,color: fontGrey,),
      
            ),
            10.widthBox,
          ],
      
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
              customTextFormField(
                title: productname,
                hint: productnameHint,
                isPassword: true,
                context: context,
                //  controller: passwordController,
                // myFocusNode: passwordFocusNode,
                onFiledSubmittedValue: (value) {
                  // Utils.fieldFocus(
                  //   context,
                  //   passwordFocusNode,
                  //   passwordFocusNode,
                  // );
                },
                onValidateValue: (value) {
                  return value.isEmpty ? 'Please enter your email' : null;
                },
              ),
              customTextFormField2(
                title: productDes,
                hint: productDesHint,
                context: context,
                //  controller: passwordController,
                // myFocusNode: passwordFocusNode,
                onFiledSubmittedValue: (value) {
                  // Utils.fieldFocus(
                  //   context,
                  //   passwordFocusNode,
                  //   passwordFocusNode,
                  // );
                },
                onValidateValue: (value) {
                  return value.isEmpty ? 'Please enter your email' : null;
                },
              ),
              customTextFormField(
                title: productPrice,
                hint: productPriceHint,
                isPassword: true,
                context: context,
                //  controller: passwordController,
                // myFocusNode: passwordFocusNode,
                onFiledSubmittedValue: (value) {
                  // Utils.fieldFocus(
                  //   context,
                  //   passwordFocusNode,
                  //   passwordFocusNode,
                  // );
                },
                onValidateValue: (value) {
                  return value.isEmpty ? 'Please enter your email' : null;
                },
              ),
          
              customTextFormField(
                title: productQuantity,
                hint: productQuantityHint,
                isPassword: true,
                context: context,
                //  controller: passwordController,
                // myFocusNode: passwordFocusNode,
                onFiledSubmittedValue: (value) {
                  // Utils.fieldFocus(
                  //   context,
                  //   passwordFocusNode,
                  //   passwordFocusNode,
                  // );
                },
                onValidateValue: (value) {
                  return value.isEmpty ? 'Please enter your email' : null;
                },
              ),
              10.heightBox ,
              productDropdown(),
              10.heightBox ,
              productDropdown(),
              Divider(),
              10.heightBox ,
              boldText(
                text: productImage,
                color: fontGrey,
              ),
              10.heightBox ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:List.generate(3, (index) => productImages(
                  lable: "${index+1}",
                )),
              ),
              10.heightBox ,
              normalText(
                text: "First Image will be your main image",
                color: fontGrey,
              ),

              Divider(),
              10.heightBox ,
              boldText(
                text: "Choose product Colors",
                color: fontGrey,
              ),
              10.heightBox ,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(9,(index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    VxBox().color(Vx.randomPrimaryColor).roundedFull.size(50,50).make(),
                    const Icon(Icons.done,color: white,),
                  ],
                )
                ),
              )


          
          
                
            ],
          ),
        ),
      ),
    );
  }
}
