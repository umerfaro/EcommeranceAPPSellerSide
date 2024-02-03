import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Utils/Utils.dart';
import '../const/const.dart';
import 'package:path/path.dart';



class ProfileController extends GetxController{


  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final TextEditingController shopnameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController shopPhoneNumberController = TextEditingController();
  final TextEditingController shopwebsiteController = TextEditingController();
  final TextEditingController shopDescription = TextEditingController();

  final shopnameFocusNode = FocusNode();
  final shopAddressFocusNode = FocusNode();
  final shopPhoneNumberFocusNode = FocusNode();
  final shopwebsiteFocusNode = FocusNode();
  final shopDescriptionFocusNode = FocusNode();

  final GlobalKey<FormState> shopSettingFormKey = GlobalKey<FormState>();

  late QueryDocumentSnapshot snapshotData;

  String oldPassword="" ;



  var profileImagePath = "".obs;

  final loading2 = false.obs;

  void setLoading2(bool value) => loading2.value = value;

   String url="";

  changeImage() async{
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
      if (pickedFile != null) {
        profileImagePath.value = pickedFile.path;
      }else {
        return null;
      }

    } on PlatformException catch (e) {
      Utils.toastMessage(e.toString());
    }

  }



  final picker = ImagePicker();

  Future getImageFromGallery(BuildContext context) async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;


    } else {
      Utils.toastMessage("No image selected");
    }
  }

  Future getImageFromCamera(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null)
    {
      profileImagePath.value = pickedFile.path;


    } else {
      Utils.toastMessage("No image selected");
    }
  }


  uploadImage() async {
    setLoading2(true);
    var filename= basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    url = await ref.getDownloadURL();
    setLoading2(false);

  }


 updateProfile({name,password,imageUrl}) async {
 var store = firestore.collection(vendorCollections).doc(currentUser!.uid);
 await store.set({
   'vendor_name': name,
    'password': password,
    'imageUrl': imageUrl,
 },SetOptions(merge:true));
 setLoading2(false);
  }

  changeAuthPassword({ email,String? oldPassword,String? newPassword}) async {

    final cred= EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {

      currentUser!.updatePassword(newPassword!).then((value) {

        Utils.toastMessage("Password Changed Successfully");
      });
    }).catchError((error) {
      Utils.toastMessage(error.toString());
    });

  }


  void pickImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: lightGrey,
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: purpleColor),
                  title: camera.text.fontFamily(semibold).color(darkFontGrey).make(),
                  onTap: () {
                    Navigator.pop(context);
                    getImageFromCamera(context);
                  },
                ),

                ListTile(
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.photo, color: purpleColor),
                  title: gallery.text.fontFamily(semibold).color(darkFontGrey).make(),
                  onTap: () {
                    Navigator.pop(context);
                    getImageFromGallery(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  updateShop({shopName,shopAddress,shopMobile,shopWebsite,shopDes}) async{
    var store = firestore.collection(vendorCollections).doc(currentUser!.uid);

    await store.set({
      'vendor_ShopName': shopName,
      'vendor_ShopAddress': shopAddress,
      'vendor_ShopMobile': shopMobile,
      'vendor_ShopWebsite': shopWebsite,
      'vendor_ShopDescription': shopDes,

    },SetOptions(merge:true));
    setLoading2(false);

  }






}