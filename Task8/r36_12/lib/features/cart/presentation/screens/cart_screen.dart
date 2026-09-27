import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_products/core/colors/colors_app.dart';
import 'package:task_products/core/constants/fonts.dart';
import 'package:task_products/core/constants/icon_size.dart';
import 'package:task_products/core/constants/radius_size.dart';
import 'package:task_products/core/widgets/custom_manrope_text.dart';
import 'package:task_products/features/cart/data/models/cart_model.dart';
import 'package:task_products/features/cart/presentation/cubit/cart_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/widgets/overlay_loading.dart';
import '../widgets/card_order_summary.dart';
import '../widgets/cart_product_item.dart';
import '../widgets/header_cart.dart';
import '../widgets/card_btn_proceed.dart';
import '../widgets/cart_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: CustomManropeText(
              title: "Delete Cart",
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize15,
              fontWeight: Fonts.fontWeightBold,
            ),
            content: CustomManropeText(
              title: "Are you sure to delete cart?",
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize15,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: CustomManropeText(
                  title: "Cancel",
                  color: ColorsApp.blackColor,
                  fontSize: Fonts.fontSize15,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: CustomManropeText(
                  title: "Delete",
                  color: ColorsApp.darkRedColor,
                  fontSize: Fonts.fontSize15,
                ),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed && context.mounted) {
      context.read<CartCubit>().deleteCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is UpdateCartLoadingState) {
          OverlayLoading.show(context);
        } else {
          OverlayLoading.hide();
        }
      },
      buildWhen: (previous, current) =>
          current is CartSuccessState ||
          current is CartFailureState ||
          current is DeleteCartSuccessState,
      builder: (context, state) {
        return Scaffold(
          appBar: CartAppBar(
            viewDeleteCart: state is CartSuccessState,
            onDelete: () {
              _confirmDelete(context);
              //
            },
          ),
          bottomNavigationBar: state is CartSuccessState
              ? CardBtnProceed(
                  discountSaving: state.cart.discountedTotal,
                  totalDue: state.cart.total - state.cart.discountedTotal,
                )
              : SizedBox(),
          body: switch (state) {
            CartInitialState() ||
            CartLoadingState() ||
            UpdateCartLoadingState() ||
            UpdateCartSuccessState() ||
            UpdateCartFailureState() ||
            DeleteCartLoadingState() => _CartShimmerView(),

            CartSuccessState() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  //cart items, 12 items, icon bookmark + save all for later
                  HeaderCart(itemsCount: state.cart.totalQuantity),

                  SizedBox(height: 10),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //image, discount , title, description, total price, total discount price, icon delete, price unit, icon mins, counter num, icon add
                          _CartProductListView(
                            cartProducts: state.cart.products,
                          ),

                          SizedBox(height: 20),

                          //order summary , subtotal, discount saving + promo, shipping, estimated tax, line, total due, including all applied discounts
                          CardOrderSummary(
                            itemsCount: state.cart.totalQuantity,
                            subTotal: state.cart.total,
                            discountSaving: state.cart.discountedTotal,
                            totalDue:
                                state.cart.total - state.cart.discountedTotal,
                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            CartFailureState(:final error) ||
            DeleteCartFailureState(:final error) => _CartErrorView(
              message: error,
              onHome: () {
                context.go(Routes.product);
              },
            ),

            DeleteCartSuccessState() => _CartErrorView(
              message: "",
              onHome: () => context.go(Routes.product),
            ),

            AddCartLoadingState() ||
            AddCartSuccessState() ||
            AddCartFailureState() => const _CartShimmerView(),
          },
        );
      },
    );
  }
}

class _CartErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onHome;
  const _CartErrorView({
    super.key,
    required this.message,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //icon error
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                //dotted container
                DottedBorder(
                  color: ColorsApp.blueColor.withValues(alpha: 0.30),
                  strokeWidth: 1.2,
                  dashPattern: const [6, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(RadiusSize.borderRadius10),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: ColorsApp.btnColor,
                      size: IconSize.iconSize50,
                    ),
                  ),
                ),
                //normal container
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(8, -8),
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: const EdgeInsets.only(bottom: 2, left: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsApp.lineColor,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsApp.blackColor.withValues(
                                alpha: 0.05,
                              ),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: IconSize.iconSize12,
                          color: ColorsApp.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          //text Your Cart is Empty
          CustomBodoniModaText(
            title: "Your Cart is Empty",
            color: ColorsApp.blackColor,
            fontSize: Fonts.fontSize30,
          ),
          //error msg
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomManropeText(
              title: message,
              color: ColorsApp.tagTextColor2,
              fontSize: Fonts.fontSize18,
              textAlign: TextAlign.center,
              maxLines: null,
            ),
          ),

          SizedBox(height: 20),

          //btn onRetryHome
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    RadiusSize.borderRadius15,
                  ),
                ),
              ),
              onPressed: onHome,
              child: CustomManropeText(
                title: "START SHOPPING",
                color: ColorsApp.whiteColor,
                fontSize: Fonts.fontSize14,
                fontWeight: Fonts.fontWeightW500,

                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartShimmerView extends StatelessWidget {
  const _CartShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Header (Cart items, count badge, save for later)
            Row(
              children: [
                _shimmerBox(width: 110, height: 26),
                const SizedBox(width: 8),
                _shimmerBox(
                  width: 65,
                  height: 24,
                  radius: RadiusSize.borderRadius15,
                ),
                const Spacer(),
                _shimmerBox(width: 120, height: 20),
              ],
            ),

            const SizedBox(height: 15),

            // Cart Items List
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        RadiusSize.borderRadius15,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image + Discount Tag Box
                            _shimmerBox(
                              width: 90,
                              height: 90,
                              radius: RadiusSize.borderRadius12,
                            ),

                            const SizedBox(width: 12),

                            // Product Details (Title, specs, price & delete icon)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _shimmerBox(width: 110, height: 18),
                                      _shimmerBox(
                                        width: 18,
                                        height: 18,
                                        radius: 4,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  _shimmerBox(width: 130, height: 12),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      _shimmerBox(width: 75, height: 18),
                                      const SizedBox(width: 8),
                                      _shimmerBox(width: 50, height: 14),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Unit Price + Quantity Stepper Control
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _shimmerBox(width: 85, height: 14),
                            _shimmerBox(
                              width: 110,
                              height: 36,
                              radius: RadiusSize.borderRadius20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    double radius = 6.0,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _CartProductListView extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  const _CartProductListView({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartProducts.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final cartProduct = cartProducts[index];
        return CardProductItem(
          cartProductModel: cartProduct,
          onQuantityChanged: (int productId, int quantity) {
            context.read<CartCubit>().updateCart(
              productId: productId,
              quantity: quantity,
            );
          },
        );
      },
    );
  }
}
