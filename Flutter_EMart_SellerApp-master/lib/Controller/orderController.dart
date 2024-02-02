import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{


  var confirmedOrders = false.obs;
   var onTheWayOrders = false.obs;
    var deliveredOrders = false.obs;


  var orders= [];
//get orders related to vendor
  getOrders(data) async{
orders.clear();
    for(var item in data['orders'])
      {
        if(item['vendor_id'] == currentUser!.uid)
          {
            orders.add(item);
          }

      }


  }

  changeStatus ({title, status, docId}) async
  {
    var store = firestore.collection(orderCollections).doc(docId);

    await store.set({
    title:status
    }, SetOptions(merge: true));
  }


}