

import 'package:cloud_firestore/cloud_firestore.dart';

import '../const/FireBase_const.dart';

class StoreServices {

  //get users data
  static getProfile(uid){

    return firestore.collection(vendorCollections).where('uid',isEqualTo: uid).get();

  }


//get all messages
static getAllMessages(uid) {
  return firestore.collection(chatCollections).where("toId",isEqualTo: uid).snapshots();
}

//get all orders

static getAllOrders(uid) {
  return firestore.collection(orderCollections).where("vendors",arrayContains: uid).snapshots();
}


  //get products data
  static getProducts(uid){
    return firestore.collection(productCollections).where('vendor_id',isEqualTo: uid).snapshots();

  }





  //get all chat messages
  static getChatMessages(docId)
  {
    return firestore.collection(chatCollections).doc(docId).collection(messageCollections).orderBy('created_on',descending: false).snapshots();
  }


  // Calculate the total rating of all user-listed products
  static Future<double> getTotalRating(uid) async {
    try {

      QuerySnapshot productsSnapshot = await firestore
          .collection(productCollections)
          .where('vendor_id', isEqualTo: uid)
          .get();

      if (productsSnapshot.docs.isNotEmpty) {
        double totalRating = 0.0;

        for (QueryDocumentSnapshot productDoc in productsSnapshot.docs) {
          // Assuming your product rating is stored as a double in the 'p_rating' field
          double productRating = double.parse(productDoc['p_rating'].toString()) ;
          totalRating += productRating;
          print(totalRating.toString());
        }

        return totalRating;
      } else {
        print("No products found");
        return 0.0; // No products found
      }
    } catch (e) {
      print("Error calculating total rating: $e");
      return 0.0;
    }
  }

  static Future<int> getTotalSales(uid) async {
    try {
      QuerySnapshot productsSnapshot = await firestore
          .collection(orderCollections)
          .where('vendors', arrayContains: uid)
          .get();

      if (productsSnapshot.docs.isNotEmpty) {
        int salesCount = productsSnapshot.docs.length;

        return salesCount;
      } else {
        print("No sales found");
        return 0; // No sales found
      }
    } catch (e) {
      print("Error calculating total sales: $e");
      return 0;
    }
  }




}