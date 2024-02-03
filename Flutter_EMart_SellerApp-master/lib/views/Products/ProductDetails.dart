import 'package:cached_network_image/cached_network_image.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: boldText(
          text: data['p_name'],
          size: 16.0,
          color: fontGrey,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          VxSwiper.builder(
          viewportFraction: 1.0,
          aspectRatio: 16 / 9,
          autoPlay: true,
          height: 350,
          itemCount: data['p_images'].length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: data["p_images"][index],
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: loadingIndicator(),
              ),
            ).box
                .clip(Clip.antiAlias)
                .margin(const EdgeInsets.symmetric(horizontal: 2))
                .withDecoration(BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ))
                .make();
          },
        ),



        10.heightBox,
            //Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                    text: data['p_name'],
                    size: 16.0,
                    color: darkGrey,
                  ),
                  //rating
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                        text: data['p_category'],
                        size: 16.0,
                        color: darkFontGrey,
                      ),
                      10.widthBox,
                      normalText(
                        text: data['p_subcategory'],
                        size: 16.0,
                        color: fontGrey,
                      )
                    ],
                  ),
                  10.heightBox,

                  Row(
                    children: [
                      VxRating(
                        value: double.parse(data['p_rating'].toString()),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        size: 20,
                        count: 5,
                        maxRating: 5,
                        isSelectable:
                            false, // Set this to false to make the rating fixed
                      ),
                      5.widthBox,
                      normalText(
                        text: data['p_rating'].toString(),
                        size: 12.0,
                        color: darkFontGrey,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(
                        text: "Price: ",
                        size: 16.0,
                        color: darkFontGrey,
                      ),
                      boldText(
                        text: " Rs.",
                        size: 16.0,
                        color: red,
                      ),
                      boldText(
                        text: data['p_price'],
                        size: 16.0,
                        color: red,
                      ),
                      boldText(
                        text: " /-",
                        size: 16.0,
                        color: red,
                      )

                    ],
                  ),
                  10.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: boldText(
                                text: "Color:",
                                size: 16.0,
                                color: darkFontGrey,
                              )),
                          Row(
                            children: List.generate(
                              data['p_colors'].length,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Color(data['p_colors'][index]))
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()
                                  .onTap(() {
                                // productController
                                //     .changeColorIndex(index);
                              }),
                            ),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      // quantity
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: boldText(
                                text: "Quantity:",
                                size: 16.0,
                                color: darkFontGrey,
                              )),
                          normalText(

                            text: data['p_quantity'],
                            size: 16.0,
                            color: fontGrey,
                          )
                        ],
                      )
                      //total price
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),

                  10.heightBox,
                  boldText(
                    text: "Product Description",
                    size: 16.0,
                    color: darkFontGrey,
                  ),
                  10.heightBox,
                  normalText(
                    text: data['p_description'],
                    size: 13.0,
                    color: fontGrey,
                  ),
                  10.heightBox,
                ],
              ),
            ),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
