import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/message/Compoents/SenderBubble.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: white,
      appBar: AppBar(
        title: boldText(
          text: "UserName",
          size: 20.0,
          color: fontGrey,
        ),
      
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
             children: [
               Expanded(child: ListView.builder(
                   itemCount: 10,
                   itemBuilder: (BuildContext context, index){
                     return Align(
                         // alignment: data['uid'] == currentUser!.uid
                         //     ? Alignment.centerRight
                         //     : Alignment.centerLeft,
                         alignment: Alignment.centerRight,
                         child: senderBubble());
                   }
               )

               ),
               Row(
                 children: [
                   Expanded(
                       child: TextFormField(
                       //  controller: chatController.msgController,
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

                       },
                       icon: Icon(
                         Icons.send,
                         color: purpleColor,
                       )),
                 ],
               )
                   .box
                   .height(80)
                   .padding(EdgeInsets.all(12))
                   .margin(EdgeInsets.only(bottom: 8))
                   .make(),
             ],
          ),
        ),
      ),
    );
  }
}
