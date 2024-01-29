import 'package:emart_seller/Controller/profileController.dart';
import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/TextFileCustom2.dart';
import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';

import '../../Utils/Utils.dart';

class Shopsetting extends StatelessWidget {
  const Shopsetting({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      ()=> Scaffold(
        resizeToAvoidBottomInset: false,
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

            controller.loading2.value? loadingIndicator():TextButton(
              onPressed: () async {
                controller.setLoading2(true);
                if (controller.shopSettingFormKey.currentState!.validate()) {
                   await controller.updateShop(
                    shopName: controller.shopnameController.text,
                    shopAddress: controller.shopAddressController.text,
                    shopMobile: controller.shopPhoneNumberController.text,
                    shopWebsite: controller.shopwebsiteController.text,
                    shopDes: controller.shopDescription.text,
                  );
                   Utils.toastMessage("Shop Updated");
                }
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
          child: Form(
            key: controller.shopSettingFormKey,
            child: Column(
              children: [
                customTextFormField(
                  title: shopName,
                  hint: nameHint,
                  isPassword: false,
                  context: context,
                  controller: controller.shopnameController,
                  myFocusNode: controller.shopnameFocusNode,
                  onFiledSubmittedValue: (value) {
                    Utils.fieldFocus(
                      context,
                      controller.shopnameFocusNode,
                      controller.shopAddressFocusNode,
                    );
                  },
                  onValidateValue: (value) {
                    return value.isEmpty ? 'Please enter your shopName' : null;
                  },
                ),
                customTextFormField(
                  title: shopAddress,
                  hint: shopAddressHint,
                  isPassword: false,
                  context: context,
                  controller: controller.shopAddressController,
                  myFocusNode: controller.shopAddressFocusNode,
                  onFiledSubmittedValue: (value) {
                    Utils.fieldFocus(
                      context,
                      controller.shopAddressFocusNode,
                      controller.shopPhoneNumberFocusNode,
                    );
                  },
                  onValidateValue: (value) {
                    return value.isEmpty ? 'Please enter your ShopAddress' : null;
                  },
                ),
                customTextFormField(
                  title: shopMobile,
                  hint: shopMobileHint,
                  isPassword: false,
                  context: context,
                  controller: controller.shopPhoneNumberController,
                  myFocusNode: controller.shopPhoneNumberFocusNode,
                  onFiledSubmittedValue: (value) {
                    Utils.fieldFocus(
                      context,
                      controller.shopPhoneNumberFocusNode,
                      controller.shopwebsiteFocusNode,
                    );
                  },
                  onValidateValue: (value) {
                    return value.isEmpty
                        ? 'Please enter your ShopPhone number'
                        : null;
                  },
                ),
                customTextFormField(
                  title: shopWeb,
                  hint: shopWebHint,
                  isPassword: false,
                  context: context,
                  controller: controller.shopwebsiteController,
                  myFocusNode: controller.shopwebsiteFocusNode,
                  onFiledSubmittedValue: (value) {
                    Utils.fieldFocus(
                      context,
                      controller.shopwebsiteFocusNode,
                      controller.shopDescriptionFocusNode,
                    );
                  },
                  onValidateValue: (value) {
                    return value.isEmpty
                        ? 'Please enter your Website if any'
                        : null;
                  },
                ),
                customTextFormField2(
                  title: shopDes,
                  hint: shopDesHint,
                  context: context,
                  controller: controller.shopDescription,
                  myFocusNode: controller.shopDescriptionFocusNode,
                  onFiledSubmittedValue: (value) {
                    Utils.fieldFocus(
                      context,
                      controller.shopDescriptionFocusNode,
                      controller.shopDescriptionFocusNode,
                    );
                  },
                  onValidateValue: (value) {
                    return value.isEmpty ? 'Please enter your ShopAddress' : null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
