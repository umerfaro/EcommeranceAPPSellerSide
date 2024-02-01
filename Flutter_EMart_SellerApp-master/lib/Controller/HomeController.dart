
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:get/get.dart';

import '../const/FireBase_const.dart';
import '../services/StoreServices.dart';

class HomeController extends GetxController {

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    getUsername();
   await updateOrderCount();
    await calculateTotalRating();
    await updateTotalSales();
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

  var orderCount = 0;

   updateOrderCount() async {
  await  StoreServices.getAllOrders(currentUser!.uid).listen((snapshot) {
      orderCount = snapshot.docs.length;
    });
  }

  var rating = 0.0;

   calculateTotalRating() async {
     rating = await StoreServices.getTotalRating(currentUser!.uid);

  }

  var totalSales = 0;

  Future<void> updateTotalSales() async {
    totalSales = await StoreServices.getTotalSales(currentUser!.uid);
    // Do something with the updated total sales value, such as updating UI or storing it in a variable.
  }



}
