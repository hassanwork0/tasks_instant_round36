import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/icon_size.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../products/data/models/products_model.dart';
import 'product_details_rounded_container.dart';

class CardTagsImagesStock extends StatelessWidget {
  final Products product;
  const CardTagsImagesStock({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorsApp.whiteColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),

            //tags
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //tags
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10,
                    spacing: 8,
                    children: [
                      //tag 1
                      ProductDetailsRoundedContainer(
                        containerColor: ColorsApp.tagColorBg1.withValues(
                          alpha: 0.80,
                        ),
                        borderRadiusContainer: RadiusSize.borderRadius20,
                        tagName: product.tags.first.toUpperCase(),
                        textColor: ColorsApp.tagTextColor,
                      ),

                      if (product.tags.length > 1 &&
                          product.tags.first != product.tags.last)
                        //tag 2
                        ProductDetailsRoundedContainer(
                          containerColor: ColorsApp.tagColorBg2.withValues(
                            alpha: 0.90,
                          ),
                          tagName: product.tags.last.toUpperCase(),
                          textColor: ColorsApp.tagTextColor2,
                        ),
                    ],
                  ),
                ),
              ],
            ),

            //image
            CarouselSlider.builder(
              itemCount: product.images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.network(
                        product.images[itemIndex],
                        fit: BoxFit.contain,
                      ),
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),

            SizedBox(height: 15),

            //available stock
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusSize.borderRadius20),
                border: Border.all(
                  color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //dot icon
                  Icon(
                    Icons.circle_rounded,
                    color: ColorsApp.darkGreenColor,
                    size: IconSize.iconSize15,
                  ),

                  SizedBox(width: 5),

                  //text in stock (99 available)
                  CustomManropeText(
                    title: "In Stock (${product.stock} available)",
                    color: ColorsApp.blackColor,
                    fontSize: Fonts.fontSize14,
                    fontWeight: Fonts.fontWeightW500,
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
