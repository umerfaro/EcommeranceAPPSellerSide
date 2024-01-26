import 'package:emart_seller/Utils/Utils.dart';
import 'package:emart_seller/WidgetCommons/CustomButton.dart';
import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar:AppBar(
       
        backgroundColor: white,
        elevation: 0,
        title: boldText(
          text: settings,
          size: 20.0,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              Image.asset(imgProduct,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButtonWidget(
                title: "Change Profile",
                onPress: (){
          
                },
                color: purpleColor,
                textColor: white,
              ),
              20.heightBox,
              Divider(),
          
              customTextFormField(
                title: vendorName,
                hint: nameHint,
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
                title: password,
                hint: passwordHint,
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
                title: confirmPassword,
                hint: confirmPasswordHint,
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
          
            ],
          ),
        ),
      ),
    );
  }
}
