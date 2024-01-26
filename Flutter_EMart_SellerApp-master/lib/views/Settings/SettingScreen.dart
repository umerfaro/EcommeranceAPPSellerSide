import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/Settings/EditScreen.dart';
import 'package:emart_seller/views/ShopSettings/ShopSettings.dart';
import 'package:emart_seller/views/message/MessageScreen.dart';
import 'package:get/get.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: boldText(
          text: settings,
          size: 20.0,
          color: fontGrey,
        ),
        actions: [

            TextButton(
              onPressed: (){
                // Get.toNamed(editProfile);
                Get.to(()=> EditProfileScreen());
              },
              child: Icon(Icons.edit,color: fontGrey,),

          ),
          10.widthBox,
        ],
      ),
      body: Column(
       children: [
         ListTile(
           leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
           title: boldText(
             text: vendorName,
             size: 16.0,
             color: darkGrey,
           ),
           subtitle: normalText(
             text: "vendorEmail",
             size: 12.0,
             color: fontGrey,
           ),


         ),
         Divider(),
         10.heightBox,
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children:List.generate(profileButtonListTitles.length, (index) => ListTile(
                onTap: (){

                  switch(index)
                      {
                      case 0:
                      {
                        // Get.toNamed(editProfile);
                        Get.to(()=> Shopsetting());
                        break;
                      }
                    case 1:
                      {
                        // Get.toNamed(editProfile);
                        Get.to(()=> MessagesScreen());
                        break;
                      }

                    default:
                      {
                        //statements;
                        break;
                      }

                  }

                },
                leading: Icon(profileButtonListIcons[index],color: fontGrey,),
                title: boldText(
                  text: profileButtonListTitles[index],
                  size: 16.0,
                  color: darkGrey,
                ),
                trailing: const Icon(Icons.arrow_forward_ios,color: fontGrey,),

             )),
           ),
         )

       ],
      ),
    );
  }
}
