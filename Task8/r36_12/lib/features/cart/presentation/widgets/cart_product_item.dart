import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_products/features/cart/data/models/cart_model.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';

class CardProductItem extends StatefulWidget {
  final CartProductModel cartProductModel;
  final Function(int productId, int quantity) onQuantityChanged;
  const CardProductItem({
    super.key,
    required this.cartProductModel,
    required this.onQuantityChanged,
  });

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 20,
          children: [
            //image, discount , title, description, total price, total discount price, icon delete
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image, discount
                Stack(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        RadiusSize.borderRadius10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsApp.tagColorBg1.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(
                            RadiusSize.borderRadius10,
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.cartProductModel.thumbnail,
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) {
                                return Center(
                                  child: SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: ColorsApp.blueColor,
                                      strokeWidth: 3.0,
                                    ),
                                  ),
                                );
                              },
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    //discount
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsApp.tagTextColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          RadiusSize.borderRadius8,
                        ),
                      ),
                      child: CustomManropeText(
                        title:
                            "${widget.cartProductModel.discountPercentage.toInt()}% OFF",
                        color: ColorsApp.lightGreenColor,
                        fontSize: Fonts.fontSize14,
                        fontWeight: Fonts.fontWeightBold,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 10),

                //title, description, total price, total discount price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      CustomManropeText(
                        title: widget.cartProductModel.title,
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize18,
                        fontWeight: Fonts.fontWeightBold,
                      ),

                      //description
                      CustomManropeText(
                        title: "10.5-inch • 64GB • White",
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize12,
                      ),

                      SizedBox(height: 15),

                      //total price, total discount price
                      FittedBox(
                        child: Row(
                          spacing: 10,
                          children: [
                            //total price
                            CustomManropeText(
                              title:
                                  "\$${widget.cartProductModel.total.toStringAsFixed(2)}",
                              color: ColorsApp.blackColor,
                              fontSize: Fonts.fontSize25,
                              fontWeight: Fonts.fontWeightBold,
                            ),

                            //total discount price
                            CustomManropeText(
                              title:
                                  "\$${widget.cartProductModel.discountedTotal.toStringAsFixed(2)}",
                              color: ColorsApp.lightGreyColor,
                              fontSize: Fonts.fontSize20,
                              fontWeight: Fonts.fontWeightBold,
                              isLineThrough: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //icon delete
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_outline_outlined),
                ),
              ],
            ),

            //price unit, icon mins, counter num, icon add
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price unit
                CustomManropeText(
                  title: "\$${widget.cartProductModel.price} / unit",
                  color: ColorsApp.blackColor,
                  fontSize: Fonts.fontSize16,
                ),

                //icon mins, counter num, icon add
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                    color: ColorsApp.containerColor,
                    borderRadius: BorderRadius.circular(
                      RadiusSize.borderRadius25,
                    ),
                  ),

                  child: Row(
                    spacing: 10,
                    children: [
                      //icon mins
                      CircleAvatar(
                        backgroundColor: ColorsApp.whiteColor,
                        child: IconButton(
                          onPressed: () {
                            if (widget.cartProductModel.quantity == 1) {
                              toastification.show(
                                context: context,
                                title: CustomManropeText(
                                  title: "Min Quantity Per Order is: 1",
                                  color: ColorsApp.blackColor,
                                  fontSize: Fonts.fontSize15,
                                ),
                                type: ToastificationType.info,
                                style: ToastificationStyle.minimal,
                                autoCloseDuration: Duration(seconds: 5),
                              );
                              return;
                            }

                            setState(() {
                              widget.cartProductModel.quantity--;
                            });
                            widget.onQuantityChanged(
                              widget.cartProductModel.id,
                              widget.cartProductModel.quantity,
                            );
                          },
                          icon: Icon(Icons.remove, color: ColorsApp.blackColor),
                        ),
                      ),

                      //counter num
                      CustomManropeText(
                        title: widget.cartProductModel.quantity.toString(),
                        color: ColorsApp.blackColor,
                        fontSize: Fonts.fontSize16,
                      ),

                      //icon add
                      CircleAvatar(
                        backgroundColor: ColorsApp.whiteColor,
                        child: IconButton(
                          onPressed: () {
                            if (widget.cartProductModel.quantity ==
                                widget.cartProductModel.maxQuantityPerOrder) {
                              toastification.show(
                                context: context,
                                title: CustomManropeText(
                                  title:
                                      "Max Quantity Per Order is: ${widget.cartProductModel.maxQuantityPerOrder}",
                                  color: ColorsApp.blackColor,
                                  fontSize: Fonts.fontSize15,
                                ),
                                type: ToastificationType.info,
                                style: ToastificationStyle.minimal,
                                autoCloseDuration: Duration(seconds: 5),
                              );
                              return;
                            }
                            setState(() {
                              widget.cartProductModel.quantity++;
                            });
                            widget.onQuantityChanged(
                              widget.cartProductModel.id,
                              widget.cartProductModel.quantity,
                            );
                          },
                          icon: Icon(
                            Icons.add_rounded,
                            color: ColorsApp.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
