import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/Controller/HomeController.dart';
import 'package:emart_seller/WidgetCommons/DashBoardButton.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/WidgetCommons/appBar.dart';
import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';

import '../../WidgetCommons/LoadingIndicator.dart';
import '../../services/StoreServices.dart';
import '../Products/ProductDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarPersonal(dashboard),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildProductsCountStream(),
              buildOrdersCountStream(),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildRatingFuture(),

              buildTotalSalesFuture(),
            ],
          ),
          10.heightBox,
          const Divider(),
          10.heightBox,
          boldText(
            text: popularProducts,
            size: 18.0,
            color: fontGrey,
          ),
          Expanded(
            child: StreamBuilder(
              stream: StoreServices.getProducts(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: loadingIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Popular Orders Yet!"));
                } else {
                  var data = snapshot.data!.docs;
                  // sorted
                  data = data.sortedBy((a, b) =>
                      b['p_wishList'].length.compareTo(a['p_wishList'].length));

                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      data.length,
                      (index) => data[index]['p_wishList'].length == 0
                          ? const SizedBox()
                          : ListTile(
                              onTap: () {
                                Get.to(() => ProductDetails(data: data[index]));
                              },
                              leading: CachedNetworkImage(
                                imageUrl: data[index]['p_images'][0],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: loadingIndicator()),
                              ),
                              title: boldText(
                                text: data[index]['p_name'].toString(),
                                size: 16.0,
                                color: darkGrey,
                              ),
                              subtitle: normalText(
                                text: data[index]['p_price']
                                    .toString()
                                    .numCurrency,
                                size: 14.0,
                                color: darkGrey,
                              ),
                            ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildProductsCountStream() {
  return  StreamBuilder(
    stream: StoreServices.getProducts(currentUser!.uid),
    builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return dashBoardButton(context,
            title: products,
            count: "0",
            icon: icProducts);
      } else if (snapshot.data!.docs.isEmpty) {

        return dashBoardButton(context,
            title: products,
            count: "0",
            icon: icProducts);
      } else {

        return dashBoardButton(context,
            title: products,
            count: snapshot.data!.docs.length.toString(),
            icon: icProducts);
      }
    },
  );
}

Widget buildOrdersCountStream() {
  return  StreamBuilder(
    stream: firestore
        .collection(orderCollections)
        .where("vendors", arrayContains: currentUser!.uid)
        .snapshots(),
    builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return dashBoardButton(context,
            title: orders, count: "0", icon: icOrders);
      } else if (snapshot.data!.docs.isEmpty) {
        return dashBoardButton(context,
            title: orders, count: "0", icon: icOrders);
      } else {
        return dashBoardButton(context,
            title: orders,
            count: snapshot.data!.docs.length.toString(),
            icon: icOrders);
      }
    },
  );
}

Widget buildRatingFuture() {
  return  FutureBuilder(
    future: firestore
        .collection(productCollections)
        .where('vendor_id', isEqualTo: currentUser!.uid)
        .get(),
    builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return dashBoardButton(context,
            title: rating, count: "0", icon: icStar);
      } else if (snapshot.data!.docs.isEmpty) {
        return dashBoardButton(context,
            title: rating, count: "0", icon: icStar);
      } else {
        double totalRating = 0.0;

        for (QueryDocumentSnapshot productDoc
        in snapshot.data!.docs) {
          double productRating =
          double.parse(productDoc['p_rating'].toString());
          totalRating += productRating;
        }

        return dashBoardButton(context,
            title: rating,
            count: totalRating.toString(),
            icon: icStar);
      }
    },
  );
}

Widget buildTotalSalesFuture() {
  return FutureBuilder(
    future: firestore
        .collection(orderCollections)
        .where('vendors', arrayContains: currentUser!.uid)
        .get(),
    builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return dashBoardButton(context,
            title: totalSales, count: "0", icon: icOrders);
      } else if (snapshot.data!.docs.isEmpty) {
        return dashBoardButton(context,
            title: totalSales, count: "0", icon: icOrders);
      } else {
        return dashBoardButton(context,
            title: totalSales,
            count: snapshot.data!.docs.length.toString(),
            icon: icOrders);
      }
    },
  );
}

