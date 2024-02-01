import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:emart_seller/views/Settings/EditScreen.dart';
import 'package:emart_seller/views/ShopSettings/ShopSettings.dart';
import 'package:emart_seller/views/message/MessageScreen.dart';
import 'package:get/get.dart';

import '../../Controller/authController.dart';
import '../../Controller/profileController.dart';
import '../../Services/Session manager.dart';
import '../../Utils/Utils.dart';
import '../../WidgetCommons/CustomButton.dart';
import '../../WidgetCommons/LoadingIndicator.dart';
import '../auth_screen/login_screen.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  var profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      bottomNavigationBar: SizedBox(
        width: context.screenWidth - 40,
        child: customButtonWidget(
          onPress: () async
          {
            await Get.put(AuthController()).signOutMethod();
            Utils.toastMessage(logOut);
            SessionController().logout();

            Get.offAll(()=> const LoginScreen());
          },
          title: "Logout",
          textColor: white,
          color: purpleColor,
        ),
      ),
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

                Get.to(()=>  EditProfileScreen(
                  username: profileController.snapshotData['vendor_name'].toString(),
                ));
              },
              child: const Icon(Icons.edit,color: fontGrey,),

          ),
          10.widthBox,
        ],

      ),

      body: FutureBuilder(
        future:StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>  snapshot ){

          if(!snapshot.hasData)
            {
              return Center(child: loadingIndicator());
            }
          else {
            profileController.snapshotData = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading:  profileController.snapshotData['imageUrl'].toString() == ""
                ? Image.asset(
                    imgProduct,
              width: 70,
              fit: BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make()
                : CachedNetworkImage(
              imageUrl:  profileController.snapshotData['imageUrl'].toString(),
              width: 70,
              fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: loadingIndicator(),
                    ),
            ).box.roundedFull.clip(Clip.antiAlias).make(),

                  //leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
                  title: boldText(
                    text: profileController.snapshotData['vendor_name'].toString(),
                    size: 16.0,
                    color: darkGrey,
                  ),
                  subtitle: normalText(
                    text: profileController.snapshotData['email'].toString(),
                    size: 12.0,
                    color: fontGrey,
                  ),


                ),
                const Divider(),
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
                              Get.to(()=> const Shopsetting());
                              break;
                            }
                          case 1:
                            {
                              // Get.toNamed(editProfile);
                              Get.to(()=> const MessagesScreen());
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
            );


          }

        },
      )
    );
  }
}
