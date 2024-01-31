import 'dart:io';

import 'package:emart_seller/Utils/Utils.dart';
import 'package:emart_seller/const/const.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/category_model.dart';

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
  var categoryvalue = "".obs;
  var subCategoryvalue = "".obs;
  var selectedColorIndex = 0.obs;

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
}
