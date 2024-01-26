import "package:emart_seller/WidgetCommons/CustomButton.dart";
import "package:emart_seller/WidgetCommons/CustomTextFormField.dart";
import "package:emart_seller/WidgetCommons/NormalText.dart";
import "package:emart_seller/const/const.dart";
import "package:emart_seller/views/Home/Home.dart";
import "package:get/get.dart";

import "../../Utils/Utils.dart";
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Column(
            children: [
              customTextFormField(
                icon: "email",
                title: email,
                hint: emailHint,
                isPassword: false,
                context: context,
                controller: emailController,
                myFocusNode: emailFocusNode,
                onFiledSubmittedValue: (value) {
                  Utils.fieldFocus(
                    context,
                    emailFocusNode,
                    passwordFocusNode,
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
                controller: passwordController,
                myFocusNode: passwordFocusNode,
                onFiledSubmittedValue: (value) {
                  Utils.fieldFocus(
                    context,
                    passwordFocusNode,
                    passwordFocusNode,
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
                 onPress: (){
                   Get.to(()=>const Home());

                 },
                  title: login,
                  textColor: white,
                  color: purpleColor,


                ),
              )


            ],

            ).box.white.rounded.outerShadowMd.padding(EdgeInsets.all(50)).make(),

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
