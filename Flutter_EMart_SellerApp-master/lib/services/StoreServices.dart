

import '../const/FireBase_const.dart';

class StoreServices {

  //get users data
  static getProfile(uid){
    return firestore.collection(vendorCollections).where('uid',isEqualTo: uid).snapshots();

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


//   //get products data
//   static getProducts(category){
//     return firestore.collection(productCollections).where('p_category',isEqualTo: category).snapshots();
//
//   }
//
//   //set sub category
//
//   static getSubCategoires(title)
//   {
//     return firestore.collection(productCollections).where('p_subcategory',isEqualTo: title).snapshots();
//   }
//
//   ///
// static getCart(uid)
// {
//   return firestore.collection(cartCollections).where('added_by',isEqualTo: uid).snapshots();
// }
//
// //delete doc
// static deleteCart(id) {
//   return firestore.collection(cartCollections).doc(id).delete();
// }
//

//
// //get all orders
// static getOrders(uid) {
//   return firestore.collection(orderCollections).where(
//       'order_by', isEqualTo: uid).snapshots();
// }
//
// //get wish list
// static getWishList(uid) {
//   return firestore.collection(productCollections).where(
//       'p_wishList', arrayContains: uid).snapshots();
// }
//
// //get all messages
// static getAllMessages(uid) {
//   return firestore.collection(chatCollections).where("fromId",isEqualTo: uid).snapshots();
// }
//
// //get counts
//   //get all counts details at ones in a list
//   //filters
// static getCounts(uid) async {
// var res= await Future.wait([
//   firestore.collection(cartCollections).where('added_by',isEqualTo: uid).get().then((value) {
//     return value.docs.length;
//   }),
//     firestore.collection(productCollections).where(
//   'p_wishList', arrayContains: uid).get().then((value) {
//     return value.docs.length;
//   }),
//   firestore.collection(orderCollections).where('order_by',isEqualTo: uid).get().then((value) {
//     return value.docs.length;
//   }),
//
// ]);
// return res;
//
//   }
//
//
//
//   //get all prodocts
// static getAllProducts() {
//   return firestore.collection(productCollections).snapshots();
// }
//
//
// //get featured products
// static getFeaturedProducts() {
//   return firestore.collection(productCollections).where(
//       'is_featured', isEqualTo: true).snapshots();
// }
//
// //get search products
// static getSearchProducts(searchText) {
//   return firestore.collection(productCollections).get();
// }



}