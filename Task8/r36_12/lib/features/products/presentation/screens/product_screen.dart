import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_products/core/constants/icon_size.dart';
import 'package:task_products/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/widgets/custom_bodoni_moda_text.dart';
import '../../../../core/widgets/custom_manrope_text.dart';
import '../../../../core/widgets/product_item.dart';
import '../../data/models/products_model.dart';
import '../cubit/products_cubit.dart';
import '../widgets/products_app_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().loadFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductsAppBar(),
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddCartSuccessState) {
            toastification.show(
              context: context,
              title: CustomManropeText(
                title: "Product Add Successfully",
                color: ColorsApp.blackColor,
                fontSize: Fonts.fontSize15,
              ),
              type: ToastificationType.success,
              style: ToastificationStyle.minimal,
              autoCloseDuration: Duration(seconds: 5),
            );

            context.read<CartCubit>().getCart();
          } else if (state is AddCartFailureState) {
            toastification.show(
              context: context,
              title: CustomManropeText(
                title: "Failed to add product",
                color: ColorsApp.blackColor,
                fontSize: Fonts.fontSize15,
              ),
              type: ToastificationType.error,
              style: ToastificationStyle.minimal,
              autoCloseDuration: Duration(seconds: 5),
            );
          }
        },
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            switch (state) {
              case ProductsInitialState():
                return SizedBox();

              case ProductsLoadingState():
                return const _ProductShimmer();

              case ProductsEmptyState():
                return const _ProductsEmpty();

              case ProductsSuccessState():
                return _ProductsList(
                  productsList: state.products,
                  isLoadingMore: state.isLoadingMore,
                );

              case ProductsFailureState():
                return const _ProductsFailure();
            }
          },
        ),
      ),
    );
  }
}

class _ProductShimmer extends StatelessWidget {
  const _ProductShimmer({super.key});

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
            height: 400,
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

class _ProductsList extends StatefulWidget {
  final List<Products> productsList;
  final bool isLoadingMore;
  const _ProductsList({
    super.key,
    required this.productsList,
    required this.isLoadingMore,
  });

  @override
  State<_ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<_ProductsList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final nearBottom =
        _controller.position.pixels >=
        _controller.position.maxScrollExtent - 300;
    if (nearBottom) context.read<ProductsCubit>().loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onScroll);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.productsList.length + (widget.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= widget.productsList.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return ProductItem(
          product: widget.productsList[index],
          onAdd: () {
            context.read<CartCubit>().addToCart(
              productId: widget.productsList[index].id,
              quantity: 1,
            );
          },
        );
      },
    );
  }
}

class _ProductsEmpty extends StatelessWidget {
  const _ProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          //container
          Container(
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: ColorsApp.tagColorBg1.withValues(alpha: 0.55),
              border: Border.all(
                color: ColorsApp.borderStockColor.withValues(alpha: 0.35),
              ),
              borderRadius: BorderRadius.circular(RadiusSize.borderRadius15),
            ),
            child: Icon(
              Icons.production_quantity_limits_rounded,
              color: ColorsApp.blueColor,
              size: IconSize.iconSize55,
            ),
          ),

          SizedBox(height: 30),

          //text No Products Found
          CustomBodoniModaText(
            title: "No Products Found",
            color: ColorsApp.blackColor,
            fontSize: Fonts.fontSize30,
          ),

          //error msg
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomManropeText(
              title: "We couldn't find any items in this category.",
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

class _ProductsFailure extends StatelessWidget {
  const _ProductsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //icon error
          const Icon(Icons.error, size: IconSize.iconSize88),
          //error message
          CustomManropeText(
            title: (context.read<ProductsCubit>().state as ProductsFailureState)
                .errorMessage,
            color: ColorsApp.blackColor,
            fontSize: Fonts.fontSize22,
          ),
        ],
      ),
    );
  }
}
