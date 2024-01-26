import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/TextFileCustom2.dart';
import 'package:emart_seller/const/const.dart';

class Shopsetting extends StatelessWidget {
  const Shopsetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: boldText(
          text: shopsetting,
          size: 20.0,
          color: fontGrey,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Get.toNamed(editProfile);
            },
            child: const Icon(
              Icons.save,
              color: fontGrey,
            ),
          ),
          10.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextFormField(
              title: shopName,
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
              title: shopAddress,
              hint: shopAddressHint,
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
              title: shopMobile,
              hint: shopMobileHint,
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
              title: shopWeb,
              hint: shopWebHint,
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
              title: shopDes,
              hint: shopDesHint,

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
    );
  }
}
