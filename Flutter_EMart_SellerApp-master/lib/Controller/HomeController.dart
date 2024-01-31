
import 'package:get/get.dart';

import '../const/FireBase_const.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    getUsername();

    super.onInit();
  }

  var naveIndex = 0.obs;



  var username = "";

  getUsername() async {

    var n=  await firestore.collection(vendorCollections).where('uid',isEqualTo:currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['vendor_name'];
      }
    });

    username=n;


  }



}
