import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_details_ui/features/products_details/data/models/products_details_model.dart';
import 'package:product_details_ui/features/products_details/presentation/cubit/product_details_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getProductDetails();
  }

  void getProductDetails() {
    context.read<ProductDetailsCubit>().getproductDetails(
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailsInitialState() || ProductDetailsLoadingState() =>
              const Center(child: CircularProgressIndicator()),
            ProductDetailsSuccessState(:final data) => ProductDetailsView(
              product: data,
            ),
            ProductDetailsNotFoundState() => const _EmptyView(),
            ProductDetailsFailureState(:final message) => _ErrorView(
              message: message,
              onRetry: getProductDetails,
            ),
          };
        },
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 50),
          SizedBox(height: 8),
          Text('Product not found', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 50, color: Colors.red),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    final reviews = product.reviews ?? const <Reviews>[];
    final hasDiscount =
        product.discountPercentage > 0 && product.discountPercentage < 100;
    final price = hasDiscount
        ? product.price * (1 - product.discountPercentage / 100)
        : product.price;
    final images = product.images.isNotEmpty
        ? product.images
        : product.thumbnail.isNotEmpty
        ? [product.thumbnail]
        : const <String>[];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductGallery(images: images),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.category.isNotEmpty)
                    Text(
                      product.category.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: 6),
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(product.rating.toStringAsFixed(1)),
                      const SizedBox(width: 5),
                      Text(
                        '(${reviews.length} reviews)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        product.stock > 0 ? 'In stock' : 'Out of stock',
                        style: TextStyle(
                          color: product.stock > 0
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        '${price.toStringAsFixed(2)} EGP',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (hasDiscount) ...[
                        const SizedBox(width: 10),
                        Text(
                          '${product.price.toStringAsFixed(2)} EGP',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${product.discountPercentage.toStringAsFixed(0)}% off',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle(title: 'Description'),
                  const SizedBox(height: 8),
                  Text(
                    product.description.isEmpty
                        ? 'No description available.'
                        : product.description,
                    style: const TextStyle(color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle(title: 'Product details'),
                  const SizedBox(height: 8),
                  if (product.brand.isNotEmpty)
                    _DetailRow(label: 'Brand', value: product.brand),
                  if (product.sku.isNotEmpty)
                    _DetailRow(label: 'SKU', value: product.sku),
                  if (product.weight > 0)
                    _DetailRow(label: 'Weight', value: '${product.weight} g'),
                  if (product.dimensions != null)
                    _DetailRow(
                      label: 'Dimensions',
                      value:
                          '${product.dimensions!.width} × '
                          '${product.dimensions!.height} × '
                          '${product.dimensions!.depth} cm',
                    ),
                  if (product.shippingInformation.isNotEmpty)
                    _DetailRow(
                      label: 'Shipping',
                      value: product.shippingInformation,
                    ),
                  if (product.warrantyInformation.isNotEmpty)
                    _DetailRow(
                      label: 'Warranty',
                      value: product.warrantyInformation,
                    ),
                  if (product.returnPolicy.isNotEmpty)
                    _DetailRow(label: 'Returns', value: product.returnPolicy),
                  if (reviews.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    const _SectionTitle(title: 'Customer reviews'),
                    const SizedBox(height: 8),
                    ...reviews.map((review) => _ReviewRow(review: review)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductGallery extends StatelessWidget {
  const _ProductGallery({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          if (images.isEmpty)
            const _ImagePlaceholder()
          else
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 1500),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.easeInExpo,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) => ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  images[itemIndex],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const _ImagePlaceholder(),
                ),
              ),
            ),
          Positioned(
            top: 8,
            left: 16,
            child: _GalleryButton(
              icon: Icons.arrow_back,
              onPressed: () {
                if (context.canPop()) context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.grey.shade500,
      ),
    );
  }
}

class _GalleryButton extends StatelessWidget {
  const _GalleryButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.9),
      shape: const CircleBorder(),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.review});

  final Reviews review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.reviewerName.isEmpty
                      ? 'Customer'
                      : review.reviewerName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 17),
              Text('${review.rating}/5'),
            ],
          ),
          if (review.comment.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(review.comment, style: const TextStyle(color: Colors.black87)),
          ],
          const Divider(height: 20),
        ],
      ),
    );
  }
}
