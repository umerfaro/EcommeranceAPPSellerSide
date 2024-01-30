import 'package:emart_seller/WidgetCommons/CustomButton.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/Orders/Components/OrderPlaced.dart';
import 'package:get/get.dart';
import "package:intl/intl.dart" as intl;

import '../../Controller/orderController.dart';
class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<OrderController>();

  @override
  void initState() {
    // TODO: implement initState

    controller.getOrders(widget.data);
    controller.confirmedOrders.value=widget.data["order_confirmation"];
    controller.onTheWayOrders.value=widget.data["order_on_the_way"];
    controller.deliveredOrders.value=widget.data["order_delivered"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Obx(
        ()=> Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            title: boldText(
              text: "Order Details",
              size: 16.0,
              color: fontGrey,
            ),

          ),
          bottomNavigationBar: Visibility(
            visible: !controller.confirmedOrders.value,
            child: SizedBox(
              height: 60,
              width: context.screenWidth,
              child: customButtonWidget(
                title: "Confirm Order",
                color: purpleColor,
                textColor: white,
                onPress: () {
                  controller.confirmedOrders(true);
                  controller.changeStatus(title: "order_confirmation", status:true, docId: widget.data.id);

                },


              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [


                  Visibility(
                    visible: controller.confirmedOrders.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        boldText(text: "Order Status",size: 16.0,color: purpleColor),

                        SwitchListTile(
                          value: true,
                          onChanged: (value){},
                          title: boldText(text: "Placed",size: 16.0,color: purpleColor),

                        ),
                        SwitchListTile(
                          value: controller.confirmedOrders.value,
                          onChanged: (value){
                            controller.confirmedOrders.value=value;
                            controller.onTheWayOrders.value=value;
                            controller.deliveredOrders.value=value;
                            controller.changeStatus(title: "order_confirmation", status:value, docId: widget.data.id);
                            controller.changeStatus(title: "order_on_the_way", status:value, docId: widget.data.id);
                            controller.changeStatus(title: "order_delivered", status:value, docId: widget.data.id);

                          },
                          title: boldText(text: "Confirm",size: 16.0,color: purpleColor),

                        ),
                        SwitchListTile(
                          value:controller.onTheWayOrders.value,
                          onChanged: (value){
                            controller.onTheWayOrders.value=value;
                            controller.changeStatus(title: "order_on_the_way", status:value, docId: widget.data.id);

                          },
                          title: boldText(text: "On Delivery",size: 16.0,color: purpleColor),

                        ),
                        SwitchListTile(
                          value: controller.deliveredOrders.value,
                          onChanged: (value){
                            controller.deliveredOrders.value=value;
                            controller.changeStatus(title: "order_delivered", status:value, docId: widget.data.id);
                          },
                          title: boldText(text: "Delivered",size: 16.0,color: purpleColor),

                        ),
                        Divider(),
                      ],
                    ).box.padding(EdgeInsets.all(8.0)).border(color: white).roundedSM.make(),
                  ),

                  ////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlaced(
                          title1: "Order Code",
                          title2: "Shipping Method",
                          detail1: widget.data["order_code"].toString(),
                          detail2:  widget.data["shipping_method"].toString()
                        ),
                      orderPlaced(
                          title1: "Order Date",
                          title2: "Payment Method",
                          detail1: intl.DateFormat()
                              .add_yMd()
                              .format(widget.data["order_date"].toDate())
                              .toString(),
                          detail2: widget.data["payment_method"].toString()
                        ),
                      orderPlaced(
                          title1: "Payment Status",
                          title2: "Delivery Status",
                          detail1: "Unpaid",
                          detail2: "Order Placed"),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                boldText(text: "Shipping Address",size: 16.0,color: purpleColor),

                                "Name: ${widget.data["order_by_name"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "Email: ${widget.data["order_by_email"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "Address: ${widget.data["order_by_address"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "City: ${widget.data["order_by_city"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "State: ${widget.data["order_by_state"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "ZipCode :${widget.data["order_by_zipCode"]}"
                                    .text
                                    .size(10)
                                    .make(),
                                "Phone number: ${widget.data["order_by_phone"]}"
                                    .text
                                    .size(10)
                                    .make(),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                boldText(text: "Total Amount",color: purpleColor),

                                "RS. ${widget.data["total_price"]}"
                                    .text
                                    .color(red)
                                    .make(),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).box.border(color: white).roundedSM.make(),
                  10.heightBox,
                  boldText(text: "Order Products",size: 16.0,color: fontGrey),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true, //becase we are in coloumn
                    children: List.generate(
                        controller.orders.length
                        , (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaced(
                              title1: controller.orders[index]["title"],
                               title2:controller.orders[index]["totalPrice"].toString(),
                              detail1: "${controller.orders[index]["qty"]}x".toString(),
                              detail2: "Refundable"
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 30,
                              height: 10,
                              color: Color(controller.orders[index]["color"]),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    }).toList(),
                  )
                      .box
                      .outerShadowMd
                      .white
                      .margin(EdgeInsets.only(bottom: 4))
                      .make(),
                  10.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [

                          boldText(text: "Subtotal",size: 16.0,color: purpleColor),
                          Spacer(),
                          "RS. ${widget.data["total_price"]}"
                              .text
                              .color(red)
                              .make(),

                        ],
                      ),
                      Row(
                        children: [

                          boldText(text: "Tax",size: 16.0,color: purpleColor),
                          Spacer(),
                          boldText(text: "0",color: red),
                        ],
                      ),
                      Row(
                        children: [

                          boldText(text: "Discount",size: 16.0,color: purpleColor),
                          Spacer(),
                          boldText(text: "0",color: red),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [



                          boldText(text: "Grand Total ",size: 16.0,color: purpleColor),
                          Spacer(),
                          "RS. ${widget.data["total_price"]}"
                              .text
                              .color(red)
                              .make(),

                        ],
                      ),
                    ],
                  ),
                  20.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
