import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:emart_seller/views/message/ChatScreen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import '../../Controller/ChatController.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: boldText(
          text: message,
          size: 20.0,
          color: fontGrey,
        ),
      ),
      body: StreamBuilder(
        stream:StoreServices.getAllMessages(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

          if(!snapshot.hasData)
            {
              return  Center(child: loadingIndicator(),);

            }else if(snapshot.data!.docs.isEmpty)
              {
                return const Center(child: Text("No Messages Yet!"),);
              }
          else
            {

              var data=snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                            (index) {

                              var t= data[index]['created_on']==null?DateTime.now():data[index]['created_on'].toDate();
                              var time = intl.DateFormat("h:mma").format(t);

                          return ListTile(
                            onTap: (){

                              Get.to(()=> const ChatScreen(),
                                  arguments: [
                                  data[index]['sender_Name'],
                                  data[index]['fromId'],
                                  ]


                              );
                            },
                            title: boldText(text:data[index]['sender_Name'].toString(),
                              color: fontGrey,
                            ),
                            subtitle: normalText(text:data[index]['last_msg'].toString(),
                              color: fontGrey,
                            ),
                            trailing: normalText(text:time,
                              color: darkGrey,
                            ),
                            leading: const CircleAvatar(
                                backgroundColor: purpleColor,
                                child: Icon(
                                  Icons.person,
                                  color: white,
                                )),
                          );
                            }),

                  ),
                ),
              );

            }

        },
      ),
    );
  }
}
