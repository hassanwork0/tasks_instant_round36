import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_products/core/constants/icon_size.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../../core/widgets/product_item.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../products/data/models/products_model.dart';
import '../cubit/search_products_cubit.dart';
import '../widgets/search_products_app_bar.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchProductsAppBar(
        onBack: () {
          _searchController.clear();
          context.pop();
        },
        controller: _searchController,
        onSearch: (String query) {
          context.read<SearchProductsCubit>().onQueryChanged(query);
        },
        onClear: () {
          _searchController.clear();
        },
      ),
      body: BlocBuilder<SearchProductsCubit, SearchProductsState>(
        builder: (context, state) {
          switch (state) {
            case SearchProductsInitialState():
              return SizedBox();

            case SearchProductsLoadingState():
              return const _SearchProductShimmer();

            case SearchProductsEmptyState():
              return _SearchProductsEmpty();

            case SearchProductsSuccessState():
              return _SearchProductsList(productsList: state.products);

            case SearchProductsFailureState():
              return _SearchProductsFailure(message: state.errorMessage);
          }
        },
      ),
    );
  }
}

class _SearchProductShimmer extends StatelessWidget {
  const _SearchProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 450,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}

class _SearchProductsList extends StatefulWidget {
  final List<Products> productsList;
  const _SearchProductsList({super.key, required this.productsList});

  @override
  State<_SearchProductsList> createState() => _SearchProductsListState();
}

class _SearchProductsListState extends State<_SearchProductsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.productsList.length,
      itemBuilder: (context, index) {
        return ProductItem(
          product: widget.productsList[index],
          onAdd: () {
            context.read<CartCubit>().addToCart(
              productId: widget.productsList[index].id,
              quantity: widget.productsList[index].minimumOrderQuantity,
            );
          },
        );
      },
    );
  }
}

class _SearchProductsEmpty extends StatelessWidget {
  const _SearchProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //error container
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: ColorsApp.tagColorBg1.withValues(alpha: 0.55),
              border: Border.all(
                color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
            ),
            child: DottedBorder(
              color: ColorsApp.borderStockColor.withValues(alpha: 0.45),
              strokeWidth: 1.5,
              dashPattern: const [3, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(RadiusSize.borderRadius15),
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsApp.whiteColor,
                  borderRadius: BorderRadius.circular(
                    RadiusSize.borderRadius15,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.search_off_sharp,
                    color: ColorsApp.searchIconColor,
                    size: IconSize.iconSize50,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          //No Results Found
          CustomBodoniModaText(
            title: " No Results Found",
            color: ColorsApp.blackColor,
            fontSize: Fonts.fontSize25,
            fontWeight: Fonts.fontWeightBold,
          ),

          const SizedBox(height: 8),

          //message/Description Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomManropeText(
              title: "We couldn't found what you're search for.",
              color: ColorsApp.tagTextColor2,
              fontSize: Fonts.fontSize16,
              textAlign: TextAlign.center,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchProductsFailure extends StatelessWidget {
  final String message;

  const _SearchProductsFailure({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 5,

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //icon error
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: ColorsApp.tagColorBg1.withValues(alpha: 0.55),
              border: Border.all(
                color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
            ),
            child: DottedBorder(
              color: ColorsApp.borderStockColor.withValues(alpha: 0.45),
              strokeWidth: 1.5,
              dashPattern: const [3, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(RadiusSize.borderRadius15),
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsApp.whiteColor,
                  borderRadius: BorderRadius.circular(
                    RadiusSize.borderRadius15,
                  ),
                ),
                child: Stack(
                  children: [
                    //icon no search
                    Center(
                      child: Icon(
                        Icons.manage_search_outlined,
                        color: ColorsApp.searchIconColor,
                        size: IconSize.iconSize50,
                      ),
                    ),

                    //icon no wifi
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 25),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: ColorsApp.lightRedColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.wifi_off_rounded,
                              color: ColorsApp.darkRedColor,
                              size: IconSize.iconSize20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          //text Unable to Load Search Results
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomBodoniModaText(
              title: "Unable to Load Search Results",
              color: ColorsApp.blackColor,
              fontSize: Fonts.fontSize25,
              textAlign: TextAlign.center,
            ),
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
        ],
      ),
    );
  }
}
