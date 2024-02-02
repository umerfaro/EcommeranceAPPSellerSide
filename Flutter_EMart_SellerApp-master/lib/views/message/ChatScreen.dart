import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:emart_seller/views/message/Compoents/SenderBubble.dart';
import 'package:get/get.dart';

import '../../Controller/ChatController.dart';
import '../../WidgetCommons/LoadingIndicator.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var chatController = Get.put(ChaTController());
    return  SafeArea(
      child: Scaffold(
        backgroundColor: white,
      appBar: AppBar(
        title: boldText(
          text: chatController.friendName,
          size: 20.0,
          color: fontGrey,
        ),
      
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
             children: [



               Obx(
                 ()=> chatController.isLoading.value  ?
                 Center(
                   child: loadingIndicator(),
                 ): Expanded(
                     child: StreamBuilder(
                       stream: StoreServices.getChatMessages(chatController.charDocId.toString()),
                       builder: (BuildContext context,
                           AsyncSnapshot<QuerySnapshot> snapshot)
                       {
                         if (!snapshot.hasData)
                         {
                           return Center
                             (
                             child: loadingIndicator(),
                           );
                         } else if (snapshot.data!.docs.isEmpty) {
                           return Center(
                             child: "Send a message to continue ..."
                                 .text
                                 .color(darkFontGrey)
                                 .make(),
                           );
                         } else {
                           return ListView(
                             children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                               var data = snapshot.data!.docs[index];
                               return Align(
                                   alignment: data['uid'] == currentUser!.uid
                                       ? Alignment.centerRight
                                       : Alignment.centerLeft,
                                   child: senderBubble(data));
                             }).toList(),
                           );
                         }
                       },
                     )
                 ),
               ),
               Row(
                 children: [
                   Expanded(
                       child: TextFormField(
                        controller: chatController.msgController,
                         decoration: InputDecoration(
                           hintText: "Type a message",
                           hintStyle: const TextStyle(color: darkFontGrey),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide.none,
                           ),
                           filled: true,
                           fillColor: lightGrey,
                           contentPadding:
                           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                         ),
                       )),
                   IconButton(
                       onPressed: () {


                         chatController.sendMsg(chatController.msgController.text);
                         chatController.msgController.clear();

                       },
                       icon: const Icon(
                         Icons.send,
                         color: purpleColor,
                       )),
                 ],
               )
                   .box
                   .height(80)
                   .padding(const EdgeInsets.all(12))
                   .margin(const EdgeInsets.only(bottom: 8))
                   .make(),
             ],
          ),
        ),
      ),
    );
  }
}
