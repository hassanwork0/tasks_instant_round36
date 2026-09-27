import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_products/core/colors/colors_app.dart';
import 'package:task_products/core/constants/icon_size.dart';
import 'package:task_products/core/constants/radius_size.dart';
import 'package:task_products/core/widgets/custom_bodoni_moda_text.dart';
import '../../features/products/data/models/products_model.dart';
import '../constants/fonts.dart';
import '../routing/routes.dart';
import 'custom_manrope_text.dart';

class ProductItem extends StatelessWidget {
  final Products product;
  final VoidCallback onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final bool showDiscount =
        product.hasDiscount && product.discountPercentageInt > 0;

    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetails, extra: product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(RadiusSize.borderRadius18),
          boxShadow: [
            BoxShadow(
              color: ColorsApp.blackColor.withValues(alpha: 0.25),
              blurRadius: RadiusSize.borderRadius10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(RadiusSize.borderRadius18),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.network(
                        product.images.first,
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported_outlined,
                            color: ColorsApp.darkRedColor,
                            size: IconSize.iconSize88,
                          );
                        },
                      ),
                    ),
                  ),
                ),

                //favorite, discount
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //favorite
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            RadiusSize.borderRadius15,
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: ColorsApp.blackColor),
                        ),
                        child: CircleAvatar(
                          radius: RadiusSize.borderRadius18,
                          backgroundColor: ColorsApp.whiteColor,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      //discount
                      if (showDiscount)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsApp.whiteColor,
                            border: Border.all(color: ColorsApp.blackColor),
                            borderRadius: BorderRadius.circular(
                              RadiusSize.borderRadius20,
                            ),
                          ),
                          child: CustomManropeText(
                            title: "${product.discountPercentageInt}% OFF",
                            color: ColorsApp.blackColor,
                            fontSize: Fonts.fontSize12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            //category, title, rating, price, btn add to cart
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //category
                  Text(
                    product.category,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: Fonts.fontSize12,
                    ),
                  ),

                  const SizedBox(height: 6),

                  //title
                  CustomBodoniModaText(
                    title: product.title,
                    color: ColorsApp.blackColor,
                    fontSize: Fonts.fontSize20,
                    fontWeight: Fonts.fontWeightBold,
                  ),

                  const SizedBox(height: 8),

                  //rating
                  Row(
                    children: [
                      //reviews length
                      CustomManropeText(
                        title: "(${product.reviews.length})",
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize14,
                        fontWeight: Fonts.fontWeightW500,
                      ),

                      const SizedBox(width: 6),

                      //rating
                      CustomManropeText(
                        title: "(${product.rating})",
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize14,
                        fontWeight: Fonts.fontWeightBold,
                      ),

                      const SizedBox(width: 4),

                      //icon star
                      const Icon(
                        Icons.star,
                        color: ColorsApp.yellowColor,
                        size: IconSize.iconSize18,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //price, discount price
                  Row(
                    children: [
                      if (product.hasDiscount && showDiscount)
                        //price
                        CustomManropeText(
                          title:
                              "\$${product.originalPrice.toStringAsFixed(2)}",
                          color: ColorsApp.lightGreyColor,
                          fontSize: Fonts.fontSize14,
                          isLineThrough: true,
                        ),
                      if (product.hasDiscount && showDiscount)
                        const SizedBox(width: 8),

                      //discount price
                      CustomManropeText(
                        title: "\$${product.price.toStringAsFixed(2)}",
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize22,
                        fontWeight: Fonts.fontWeightBold,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // btn add to cart
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        onAdd();
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: ColorsApp.blueColor,
                      ),
                      label: const CustomManropeText(
                        title: "Add To Cart",
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize14,
                        fontWeight: Fonts.fontWeightW500,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: ColorsApp.blackColor.withValues(alpha: 0.70),
                          width: 1.2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            RadiusSize.borderRadius12,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
