import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emart_seller/Utils/Utils.dart';
import 'package:emart_seller/WidgetCommons/CustomButton.dart';
import 'package:emart_seller/WidgetCommons/CustomTextFormField.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';

import '../../Controller/profileController.dart';
class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  var profileController = Get.find<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    profileController.nameController.text = widget.username!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Obx(
      ()=> Scaffold(
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

          profileController.loading2.value? loadingIndicator() :TextButton(

              onPressed: () async{
                profileController.setLoading2(true);

                //if image is not selected

                if(profileController.profileImagePath.value.isNotEmpty)
                  {
                   await profileController.uploadImage();
                    }
                else
                  {
                    profileController.url=profileController.snapshotData['imageUrl'];
                  }

                // if old password data base

                if(profileController.snapshotData['password'] == profileController.passwordController.text)
                  {
                    await profileController.changeAuthPassword(
                      email: profileController.snapshotData['email'],
                      oldPassword: profileController.passwordController.text,
                      newPassword: profileController.confirmPasswordController.text,

                    );

                    await profileController.updateProfile(
                      imageUrl: profileController.url,
                      name: profileController.nameController.text,
                      password: profileController.confirmPasswordController.text,
                    );

                    Utils.toastMessage("Updated");
                    profileController.setLoading2(false);

                    //password not change
                  } else if( profileController.passwordController.text.isEmptyOrNull && profileController.confirmPasswordController.text.isEmptyOrNull )
                    {

                      await profileController.updateProfile(
                        imageUrl:profileController.url,
                        name: profileController.nameController.text,
                        password:profileController.snapshotData['password'] ,
                      );
                      Utils.toastMessage("Updated");
                      profileController.setLoading2(false);

                    }else
                      {
                        Utils.toastMessage("Some error occured");
                        profileController.setLoading2(false);
                      }





              },
              child: const Icon(Icons.save,color: fontGrey,),

            ),
            10.widthBox,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:  Column(
                children: [

                  profileController.snapshotData['imageUrl'] == "" && profileController.profileImagePath.isEmpty
                      ? Image.asset(
                    imgProduct,
                    width: 70,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                      : profileController.snapshotData['imageUrl'] != " " && profileController.profileImagePath.isEmpty
                      ? CachedNetworkImage(
                    imageUrl: profileController.snapshotData['imageUrl'],
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                    File(profileController.profileImagePath.value),
                    fit: BoxFit.cover,
                    width: 80,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),

                  10.heightBox,
                  customButtonWidget(
                    title: "Change Profile",
                    onPress: (){
                      profileController.pickImage(context);

                    },
                    color: purpleColor,
                    textColor: white,
                  ),
                  20.heightBox,
                  const Divider(),

                  customTextFormField(
                    title: vendorName,
                    hint: nameHint,
                    isPassword: false,
                    context: context,
                   controller: profileController.nameController,
                   myFocusNode: profileController.nameFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        profileController.nameFocusNode,
                        profileController.passwordFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your Name' : null;
                    },
                  ),
                  30.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: boldText(
                      text: "Change your password",
                      size: 16.0,
                      color: fontGrey,
                    ),
                  ),
                  10.heightBox,
                  customTextFormField(
                    title: password,
                    hint: passwordHint,
                    isPassword: true,
                    context: context,
                     controller: profileController.passwordController,
                     myFocusNode: profileController.passwordFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        profileController.passwordFocusNode,
                        profileController.confirmPasswordFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your password' : null;
                    },
                  ),
                  customTextFormField(
                    title: confirmPassword,
                    hint: confirmPasswordHint,
                    isPassword: true,
                    context: context,
                     controller:profileController.confirmPasswordController,
                     myFocusNode: profileController.confirmPasswordFocusNode,
                    onFiledSubmittedValue: (value) {
                      Utils.fieldFocus(
                        context,
                        profileController.confirmPasswordFocusNode,
                        profileController.confirmPasswordFocusNode,
                      );
                    },
                    onValidateValue: (value) {
                      return value.isEmpty ? 'Please enter your passwordAgain' : null;
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
