import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_products/core/constants/icon_size.dart';
import 'package:task_products/core/widgets/custom_bodoni_moda_text.dart';
import 'package:task_products/features/products/data/models/products_model.dart';
import 'package:task_products/features/products_details/presentation/cubit/products_details_cubit.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../widgets/card_tags_images_stock.dart';
import '../widgets/description.dart';
import '../widgets/first_word_title_and_sku.dart';
import '../widgets/full_title_reviews.dart';
import '../widgets/price_quantity.dart';
import '../widgets/specs_section.dart';
import '../widgets/tags_section.dart';
import '../widgets/card_btn_add_to_bag.dart';
import '../widgets/product_details_app_bar.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final int productId;
  final Products product;
  const ProductsDetailsScreen({
    super.key,
    required this.productId,
    required this.product,
  });

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint("id: ${widget.productId.toString()}");
    getProductDetails();
  }

  void getProductDetails() {
    context.read<ProductsDetailsCubit>().getProductDetails(
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDetailsCubit, ProductsDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ProductDetailsAppBar(titleAppBar: widget.product.title),
          bottomNavigationBar: CardBtnAddToBag(
            price: widget.product.price,
            units: widget.product.minimumOrderQuantity,
            viewCardBtn: state is ProductsDetailsSuccessState,
          ),
          body: switch (state) {
            ProductsDetailsInitialState() || ProductsDetailsLoadingState() =>
              Center(child: _ProductsDetailsShimmerView()),

            ProductsDetailsSuccessState(product: final data) =>
              _ProductDetailsView(product: data, dimensions: data.dimensions),

            ProductsDetailsNotFoundState() => _NotFoundProductView(),

            ProductsDetailsFailureState(:final errorMessage) => _ErrorView(
              message: errorMessage,
              onRetry: () {
                getProductDetails();
              },
            ),
          },
        );
      },
    );
  }
}

class _ProductsDetailsShimmerView extends StatelessWidget {
  const _ProductsDetailsShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),

            //tags, images, available stock
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // tags
                  Row(
                    children: [
                      _shimmerBox(
                        width: 75,
                        height: 26,
                        radius: RadiusSize.borderRadius20,
                      ),
                      const SizedBox(width: 10),
                      _shimmerBox(
                        width: 85,
                        height: 26,
                        radius: RadiusSize.borderRadius20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  //image
                  Center(
                    child: _shimmerBox(width: 180, height: 220, radius: 12),
                  ),

                  const SizedBox(height: 25),

                  //available stock
                  _shimmerBox(
                    width: 160,
                    height: 32,
                    radius: RadiusSize.borderRadius20,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //first word title , sku
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _shimmerBox(width: 70, height: 14),
                _shimmerBox(width: 140, height: 14),
              ],
            ),

            const SizedBox(height: 12),

            //first word title
            _shimmerBox(width: double.infinity, height: 26),
            const SizedBox(height: 8),
            //sku
            _shimmerBox(width: 130, height: 26),

            const SizedBox(height: 16),

            //reviews
            _shimmerBox(
              width: 90,
              height: 32,
              radius: RadiusSize.borderRadius5,
            ),

            const SizedBox(height: 20),

            //price & quantity
            _shimmerBox(
              width: double.infinity,
              height: 95,
              radius: RadiusSize.borderRadius15,
            ),

            const SizedBox(height: 70),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _NotFoundProductView extends StatelessWidget {
  const _NotFoundProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //container 404 error
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsApp.tagColorBg1.withValues(alpha: 0.55),
                  border: Border.all(
                    color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                  ),
                  borderRadius: BorderRadius.circular(
                    RadiusSize.borderRadius15,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    color: ColorsApp.blueColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(
                      RadiusSize.borderRadius15,
                    ),
                    border: Border.all(
                      color: ColorsApp.borderStockColor.withValues(alpha: 0.20),
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomBodoniModaText(
                        title: "404",
                        color: ColorsApp.blueColor,
                        fontSize: Fonts.fontSize40,
                        fontWeight: Fonts.fontWeightW500,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          color: ColorsApp.lineColor,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            //text product not found
            CustomBodoniModaText(
              title: "Product Not Found",
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize30,
            ),
            //error msg
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomManropeText(
                title:
                    "The cosmetic or formula you are looking for may have been retired, discontinued, or moved to a new collection.",
                color: ColorsApp.tagTextColor2,
                fontSize: Fonts.fontSize18,
                textAlign: TextAlign.center,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({super.key, required this.message, required this.onRetry});

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
                //white container + dotted container
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorsApp.whiteColor,
                    border: Border.all(
                      color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(
                      RadiusSize.borderRadius15,
                    ),
                  ),
                  child: DottedBorder(
                    color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                    strokeWidth: 1.2,
                    dashPattern: const [6, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(RadiusSize.borderRadius10),
                    child: Center(
                      child: Icon(
                        Icons.cloud_off_outlined,
                        color: ColorsApp.titleOneWordColor,
                        size: IconSize.iconSize50,
                      ),
                    ),
                  ),
                ),

                //3 circles (white,grey,red)
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                      offset: const Offset(8, 8),
                      child: Container(
                        width: 36,
                        height: 36,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsApp.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsApp.blackColor.withValues(
                                alpha: 0.05,
                              ),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsApp.tagColorBg1.withValues(
                              alpha: 0.85,
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsApp.darkRedColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          //text Something Went Wrong
          CustomBodoniModaText(
            title: "SomethingWentWrong",
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

          //btn onRetry
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    RadiusSize.borderRadius15,
                  ),
                ),
              ),
              onPressed: onRetry,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh_outlined,
                    color: ColorsApp.whiteColor,
                    size: IconSize.iconSize18,
                  ),
                  CustomManropeText(
                    title: "TRY AGAIN",
                    color: ColorsApp.whiteColor,
                    fontSize: Fonts.fontSize14,
                    fontWeight: Fonts.fontWeightW500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  final Products product;
  final Dimensions dimensions;

  const _ProductDetailsView({
    super.key,
    required this.product,
    required this.dimensions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),

            //tags, images, available stock
            CardTagsImagesStock(product: product),

            SizedBox(height: 20),

            //first word title , sku
            FirstWordTitleAndSku(product: product),

            //full title, review
            FullTitleReviews(product: product),

            SizedBox(height: 20),

            //price , discount percentage, status, text min order quantity , units
            PriceQuantity(product: product),

            SizedBox(height: 20),

            //description
            Description(product: product),

            SizedBox(height: 20),

            //specs
            SpecsSection(product: product, dimensions: dimensions),

            SizedBox(height: 35),

            //tags
            TagsSection(product: product),

            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
