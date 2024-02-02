
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:get/get.dart';

import '../const/FireBase_const.dart';
import '../services/StoreServices.dart';

class HomeController extends GetxController {

  @override
  void onInit()  async {
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
    print("Helooooooooooooooooooooo");
    print(SessionController().userId);

    var n=  await firestore.collection(vendorCollections).where('uid',isEqualTo:SessionController().userId).get().then((value) {
      if(value.docs.isNotEmpty)
      {
        return value.docs.single['vendor_name'];
      }
    });

    username=n;
    print(username.toString());

  }

  var orderCount = 0;

   updateOrderCount() async {

       firestore.collection(orderCollections).where("vendors",arrayContains: SessionController().userId).snapshots().listen((snapshot) {
       if(snapshot.docs.isNotEmpty){

         orderCount = snapshot.docs.length;
       }

     });
  }

  var rating = 0.0;

   calculateTotalRating() async {
     rating = await StoreServices.getTotalRating(SessionController().userId);

  }

  var totalSales = 0;

  Future<void> updateTotalSales() async {
    totalSales = await StoreServices.getTotalSales(SessionController().userId);
    // Do something with the updated total sales value, such as updating UI or storing it in a variable.
  }



}
