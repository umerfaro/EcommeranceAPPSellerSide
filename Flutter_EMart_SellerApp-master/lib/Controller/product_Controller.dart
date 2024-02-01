import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Controller/HomeController.dart';
import 'package:emart_seller/Utils/Utils.dart';
import 'package:emart_seller/const/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/category_model.dart';
import 'package:path/path.dart';

class ProductController extends GetxController {
  /// text filed
  var pnameController = TextEditingController();
  var pdecController = TextEditingController();
  var pPriceController = TextEditingController();
  var pQuntityController = TextEditingController();

  final pnameFocusNode = FocusNode();
  final pdecFocusNode = FocusNode();
  final pPriceFocusNode = FocusNode();
  final pQuntityFocusNode = FocusNode();

  final GlobalKey<FormState> productFormKey = GlobalKey<FormState>();

  var categoryList = <String>[].obs; //reactive String
  var subcategoryList = <String>[].obs; //reac// tive String
  List<Category> category = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);
  var pImagesLinkList = [];
  var categoryvalue = "".obs;
  var subCategoryvalue = "".obs;
  var selectedColorIndex = 0.obs;


  var isLoading = false.obs;

  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);

    category = cat.categories;
  }

  populateCategoriesList() {
    categoryList.clear();

    for (var item in category) {
      categoryList.add((item.name));
    }
  }

  populateSubCategoriesList(cat) {
    subcategoryList.clear();

    var s = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < s.first.subcategory.length; i++) {
      subcategoryList.add((s.first.subcategory[i]));
    }
  }

  picImages(index,context) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }



  uploadImages() async{
    pImagesLinkList.clear();
    for(var item in pImagesList){
      if(item!=null){

        var filename= basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();

        pImagesLinkList.add(n);

        }
    }


  }
  
  
  uploadProduct() async{
    var store = firestore.collection(productCollections).doc();
    await store.set({
      'is_featured': false,
      'p_category': categoryvalue.value,
      'p_subcategory': subCategoryvalue.value,
      'p_name': pnameController.text,
      'p_description': pdecController.text,
      'p_price': pPriceController.text,
      'p_quantity': pQuntityController.text,
      'p_images': FieldValue.arrayUnion(pImagesLinkList),
      'p_colors': FieldValue.arrayUnion([Colors.red.value,Colors.brown.value]),
      'p_rating': "5.0",
      'p_wishList': [],
      'p_seller': Get.find<HomeController>().username,
      'vendor_id': currentUser!.uid,
      'featured_id': "",


    });

    isLoading.value = false;

    Utils.toastMessage("Product Added Successfully");
}



addFeatured(docID)async{

  await firestore.collection(productCollections).doc(docID).set({
      'featured_id': currentUser!.uid,
      'is_featured': true,


    },SetOptions(merge: true));


}

  removeFeatured(docID)async{

    await firestore.collection(productCollections).doc(docID).set({
      'featured_id': "",
      'is_featured': false,


    },SetOptions(merge: true));


  }


  removeProduct(docID)async {
    await firestore.collection(productCollections).doc(docID).delete();
  }


}
