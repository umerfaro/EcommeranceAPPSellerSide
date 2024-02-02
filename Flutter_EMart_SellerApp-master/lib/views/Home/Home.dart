import "package:emart_seller/Controller/HomeController.dart";
import "package:emart_seller/WidgetCommons/NormalText.dart";
import "package:emart_seller/const/const.dart";
import "package:emart_seller/views/HomeScreen/HomeScreen.dart";
import "package:emart_seller/views/Orders/OrderScreen.dart";
import "package:emart_seller/views/Products/ProductsScreen.dart";
import "package:emart_seller/views/Settings/SettingScreen.dart";
import "package:get/get.dart";

import "../../WidgetCommons/exist_dialog.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  var homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {



    var navScreens = [
      const HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const SettingScreen(),
    ];

    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined,
        color: darkGrey,
          size: 27,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProducts,
          color: darkGrey,
          width: 24,
        ),
        label: products,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icOrders,
          color: darkGrey,
          width: 24,
        ),
        label: orders,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icGeneralSettings,
          color: darkGrey,
          width: 24,
        ),
        label: settings,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          items: bottomNavbar,
          backgroundColor: white,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          type: BottomNavigationBarType.fixed,

          currentIndex: homeController.naveIndex.value,
          onTap: (index) {
            // Respond to item press.
           homeController.naveIndex.value = index;
          },
        ),
      ),
      backgroundColor: white,
      body:
      PopScope(
        canPop: false  ,

        onPopInvoked: (didPop) {
          // Handle back button press
          // Handle back button press
          if (didPop) {
            //SystemNavigator.pop();
            return ;

          }

          showDialog(
              barrierDismissible: false,
              context: context, builder: (context)=> exitDialogWidget(context));
        },


        child: Column(children: [
            Expanded(child: Obx (()=> navScreens.elementAt(homeController.naveIndex.value))
            ),
          ]
          ),
      ),

    );
  }
}
