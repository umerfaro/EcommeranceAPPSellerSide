import 'package:emart_seller/WidgetCommons/CustomButton.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/Orders/Components/OrderPlaced.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: boldText(
            text: "Order Details",
            size: 16.0,
            color: fontGrey,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          width: context.screenWidth,
          child: customButtonWidget(
            title: "Confirm Order",
            color: purpleColor,
            textColor: white,
            onPress: () {},
      
      
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [

                Visibility(
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      boldText(text: "Order Status",size: 16.0,color: purpleColor),
                      
                      SwitchListTile(
                        value: false, onChanged: (value){},
                        title: boldText(text: "Placed",size: 16.0,color: purpleColor),
                  
                      ),
                      SwitchListTile(
                        value: false, onChanged: (value){},
                        title: boldText(text: "Confirm",size: 16.0,color: purpleColor),
                  
                      ),
                      SwitchListTile(
                        value: false, onChanged: (value){},
                        title: boldText(text: "On Delivery",size: 16.0,color: purpleColor),
                  
                      ),
                      SwitchListTile(
                        value: false, onChanged: (value){},
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
                        detail1: "abd", //"data["order_code"].toString()",
                        detail2:  "method", //"data["shipping_method"].toString()
                      ),
                    orderPlaced(
                        title1: "Order Date",
                        title2: "Payment Method",
                        detail1: "Time",
                        // detail1: intl.DateFormat()
                        //     .add_yMd()
                        //     .format(data["order_date"].toDate())
                        //     .toString(),
                        detail2: "paymnet"  //"data["payment_method"].toString()"
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
      
                              "Name: "
                                  .text
                                  .size(10)
                                  .make(),
                              "Email: "
                                  .text
                                  .size(10)
                                  .make(),
                              "address: "
                                  .text
                                  .size(10)
                                  .make(),"address: "
                                  .text
                                  .size(10)
                                  .make(),
      
      
                              // "Name: ${data["order_by_name"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "Email: ${data["order_by_email"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "Address: ${data["order_by_address"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "City: ${data["order_by_city"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "State: ${data["order_by_state"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "ZipCode :${data["order_by_zipCode"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                              // "Phone number: ${data["order_by_phone"]}"
                              //     .text
                              //     .size(10)
                              //     .make(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
      
                              boldText(text: "Total Amount",color: purpleColor),
                              boldText(text: "200",size: 16.0,color: red),
      
      
                              // "RS. ${data["total_price"]}"
                              //     .text
                              //     .color(redColor)
                              //     .make(),
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
                  children: List.generate(3 //data["orders"].length
                      , (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaced(
                            title1:"abc", //. "data["orders"][index]["title"]",
                             title2:"abc", //data["orders"][index]["totalPrice"].toString(),
                            detail1: "abc2",
                            //"${data["orders"][index]["qty"]}x".toString(),
                            detail2: "Refundable"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 30,
                            height: 10,
                            color: purpleColor,
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
                        boldText(text: "RS. 123",color: red),
      
                      ],
                    ),
                    Row(
                      children: [
      
                        boldText(text: "Tax",size: 16.0,color: purpleColor),
                        Spacer(),
                        boldText(text: "RS. 123",color: red),
                      ],
                    ),
                    Row(
                      children: [
      
                        boldText(text: "Discount",size: 16.0,color: purpleColor),
                        Spacer(),
                        boldText(text: "RS. 123",color: red),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
      
                        // "RS. ${data["total_price"]}"
                        //     .text
                        //     .color(redColor)
                        //     .make(),
      
                        boldText(text: "Grand Total ",size: 16.0,color: purpleColor),
                        Spacer(),
                        boldText(text: "RS. 123",color: red),
      
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
    );
  }
}
