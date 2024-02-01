import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Controller/orderController.dart';
import 'package:emart_seller/Services/Session%20manager.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/services/StoreServices.dart';
import 'package:emart_seller/views/Orders/order_Details.dart';
import 'package:get/get.dart';
import "package:intl/intl.dart" as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderController());
    return Scaffold(
      backgroundColor: white,
      appBar: appBarPersonal(orders),
      body: StreamBuilder(
        stream: StoreServices.getAllOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Orders Yet!"),
            );
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index) {
                    var t= data[index]['order_date'];
                    return ListTile(
                      onTap: () {

                        Get.to(() =>  OrderDetails(
                          data: data[index],
                        ));
                      },
                      tileColor: textfieldGrey,
                      title: boldText(
                        text: data[index]['order_code'].toString(),
                        size: 16.0,
                        color: purpleColor,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: fontGrey,
                              ),
                              10.widthBox,
                              boldText(
                                text: intl.DateFormat()
                                    .add_yMd()
                                    .format(t.toDate()),
                                size: 12.0,
                                color: fontGrey,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.payment,
                                color: fontGrey,
                              ),
                              10.widthBox,
                              boldText(
                                text: "unpaid",
                                size: 12.0,
                                color: red,
                              ),
                            ],
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      trailing: normalText(
                        text: data[index]['total_price'].toString(),
                        size: 14.0,
                        color: purpleColor,
                      ),
                    ).box.margin(const EdgeInsets.only(bottom: 4)).make();
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
