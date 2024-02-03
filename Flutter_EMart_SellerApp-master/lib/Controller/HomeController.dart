
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:get/get.dart';

import '../const/FireBase_const.dart';

class HomeController extends GetxController {

  @override
  void onInit()  async {
    // TODO: implement onInit
      getUsername();
    super.onInit();
  }

  var naveIndex = 0.obs;



  var username = "";

  getUsername() async {

    var n=  await firestore.collection(vendorCollections).where('uid',isEqualTo:SessionController().userId).get().then((value) {
      if(value.docs.isNotEmpty)
      {
        return value.docs.single['vendor_name'];
      }
    });

    username=n;

  }




}
