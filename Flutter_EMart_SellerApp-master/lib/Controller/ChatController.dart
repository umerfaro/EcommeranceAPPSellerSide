

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/Session manager.dart';
import '../const/FireBase_const.dart';
import 'HomeController.dart';

class ChaTController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getChatId();
    super.onInit();
  }

  var chats = firestore.collection(chatCollections);
  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];

  var senderName = Get.find<HomeController>().username;
  var currentId = SessionController().userId;

  var msgController = TextEditingController();

  var isLoading = false.obs;

  dynamic charDocId;

  getChatId() async {
    isLoading.value = true;

    await chats
        .where('users', isEqualTo: {friendId: null, currentId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot)
    {
      if (snapshot.docs.isNotEmpty)
      {
        charDocId = snapshot.docs.single.id;
      } else {
        chats.add({
          'created_on': null,
          'last_msg': null,
          'users': {friendId: null, currentId: null},
          'toId': "",
          'fromId': "",
          'friend_Name': friendName,
          'sender_Name': senderName,
        }).then((value) {
          charDocId = value.id;
        });
      }
    });
    isLoading.value = false;
  }

  sendMsg(String msg) async {
    if (msg.trim().isNotEmpty)
    {
      chats.doc(charDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toId': currentId,
        'fromId': friendId,
      });

      //kis nah message kiya
      chats.doc(charDocId).collection(messageCollections).doc().set({
        'msg': msg,
        'uid': currentId,
        'created_on': FieldValue.serverTimestamp(),
      });
    }
  }
}