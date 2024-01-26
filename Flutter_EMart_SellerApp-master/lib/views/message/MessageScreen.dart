import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/message/ChatScreen.dart';
import 'package:get/get.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                10,
                (index) => ListTile(
                  onTap: (){

       Get.to(()=> ChatScreen());
                  },
                  title: boldText(text:"UserName",
                    color: fontGrey,
                  ),
                      subtitle: normalText(text:"Message",
                      color: fontGrey,
                      ),
                      trailing: normalText(text:"Time",
                      color: darkGrey,
                      ),
                      leading: const CircleAvatar(
                        backgroundColor: purpleColor,
                          child: Icon(
                        Icons.person,
                        color: white,
                      )),
                    )),

          ),
        ),
      ),
    );
  }
}
