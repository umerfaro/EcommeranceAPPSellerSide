import 'package:cached_network_image/cached_network_image.dart';
import 'package:emart_seller/WidgetCommons/LoadingIndicator.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: boldText(
          text: "Product Name",
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
              itemCount: 3, //data['p_images'].length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg", //data["p_images"][index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: loadingIndicator(),
                  ),
                )
                    .box
                    .clip(Clip.antiAlias)
                    .margin(const EdgeInsets.symmetric(horizontal: 2))
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
                    text: "Product Name",
                    size: 16.0,
                    color: darkGrey,
                  ),
                  //rating
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                        text: "Category",
                        size: 16.0,
                        color: darkFontGrey,
                      ),
                      10.widthBox,
                      normalText(
                        text: "SubCategory",
                        size: 16.0,
                        color: fontGrey,
                      )

                    ],
                  ),
                  10.heightBox,

                  Row(
                    children: [
                      VxRating(
                        value: 3.0,
                        //  double.parse(data['p_rating'].toString()),
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
                        text: "(2)",
                        size: 12.0,
                        color: darkFontGrey,
                      ),
                    ],
                  ),
                  boldText(
                    text: "Rs 400",
                    size: 16.0,
                    color: red,
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
                            )
                          ),
                          Row(
                            children: List.generate(
                              3,
                              //data['p_colors'].length,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
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
                            child:boldText(
                              text: "Quantity:",
                              size: 16.0,
                              color: darkFontGrey,
                            )
                          ),
                          normalText(
                            text: "1",
                            size: 16.0,
                            color: fontGrey,
                          )
                        ],
                      )
                      //total price
                    ],
                  ).box.white.padding(EdgeInsets.all(8)).make(),

                  10.heightBox,
                  boldText(
                    text: "Product Description",
                    size: 16.0,
                    color: darkFontGrey,
                  ),
                  10.heightBox,
                  normalText(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget fermentum aliquam, nibh nibh aliquet nunc, eget aliquam nisl nunc eget nibh. Nulla euismod, nisl eget fermentum aliquam, nibh nibh aliquet nunc, eget aliquam nisl nunc eget nibh.",
                    size: 12.0,
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
