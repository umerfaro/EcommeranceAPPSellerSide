import "package:emart_seller/Controller/authController.dart";
import "package:emart_seller/WidgetCommons/CustomButton.dart";
import "package:emart_seller/WidgetCommons/CustomTextFormField.dart";
import "package:emart_seller/WidgetCommons/NormalText.dart";
import "package:emart_seller/const/const.dart";
import "package:emart_seller/views/Home/Home.dart";
import "package:get/get.dart";


import "../../Utils/Utils.dart";
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
  var controller= Get.put(AuthController());
    return   SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,

        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.heightBox,
         normalText(
             text: welcome,
           size: 18.0,
         ),
            Row(
              children: [
                10.heightBox,
                Image.asset(
                  icLogo,
                  width: 70,
                  height: 70,
                ).box.border(
                    color: white
                ).rounded.padding(EdgeInsets.all(8)).makeCentered(),
                10.widthBox,
                boldText(
                    text:appname,
                    size: 20.0
                ),

              ],
            ),
            10.heightBox,
     normalText(
       text: logintocontinue,
       size: 18.0,
         color: lightGrey,
     ),
            10.heightBox,
            Form(
              key: controller.logInFormKey,
              child: Obx(
                ()=> Column(
                children: [
                  customTextFormField(
                    icon: "email",
                    title: email,
                    hint: emailHint,
                    isPassword: false,
                    context: context,
                    controller: controller.emailController,
                    myFocusNode: controller.emailFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.emailFocusNode,
                        controller.passwordFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your email' : null;
                    },
                  ),
                  10.heightBox,
                  customTextFormField(
                    icon: "password",
                    title: password,
                    hint: passwordHint,
                    isPassword: true,
                    context: context,
                    controller: controller.passwordController,
                    myFocusNode: controller.passwordFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        controller.passwordFocusNode,
                        controller.passwordFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your email' : null;
                    },
                  ),
                   10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(

                        onPressed: () {},
                        child: normalText(
                          text: forgotPassword,
                          size: 14.0,
                          color: purpleColor,
                        ),
                      ),
                    ],
                  ),

                  20.heightBox,
                  SizedBox(
                    width: context.screenWidth-100,
                    child: customButtonWidget(
                      loading: controller.loginButtonEnable.value,
                     onPress: ()async {
                       if (controller.logInFormKey.currentState!.validate())
                       {


                         await controller.loginMethod().then((value)
                         {
                           if (value != null) {
                             Utils.toastMessage(loginSuccess);

                             Get.offAll(() => const Home());
                             controller.loginButtonEnable.value = false;


                           } else {
                             controller.loginButtonEnable.value = false;
                             Utils.toastMessage(loginFailed);
                           }
                         }).onError((error, stackTrace) => Utils.toastMessage(error.toString()));

                       }
                     },
                      title: login,
                      textColor: white,
                      color: purpleColor,


                    ),
                  )


                ],

                ).box.white.rounded.outerShadowMd.padding(EdgeInsets.all(50)).make(),
              ),
            ),

             10.heightBox,
            Center(
              child: normalText(
                text: anyProblem,
                size: 14.0,
                color: lightGrey,
              ),
            ),
            Spacer(),
            Center(
              child: boldText(
                text: credit,
                size: 14.0,
              ),
            ),
            20.heightBox,



          ],
        ),
      ),
    );
  }
}
