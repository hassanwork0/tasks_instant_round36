import 'package:flutter/material.dart';
import 'package:product_list_4_stages/features/products/data/product.dart';
import 'package:toastification/toastification.dart';



class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Image(widget: widget),
                _Category(widget: widget),
                _Name(widget: widget),
                _Rating(widget: widget),
                _Price(widget: widget),
                _Actions(widget: widget),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return widget.product.isAvailable
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () {
                toastification.show(
                  context: context,
                  direction: TextDirection.rtl,
                  title: Text("تم الاضافة الي السلة ب نجاح"),
                );
              },
              label: Text("اضف للسلة"),
              icon: Icon(Icons.shopping_basket_rounded),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () {
                toastification.show(
                  context: context,
                  direction: TextDirection.rtl,
                  title: Text("هنبلغك اول ما يتوفر"),
                );
              },
              label: Text("بلغني لما يتوفر"),
              icon: Icon(Icons.notifications),
            ),
          );
  }
}

class _Price extends StatelessWidget {
  const _Price({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Text(
            "${widget.product.price.toStringAsFixed(0)}ج.م",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          if (widget.product.hasDiscount) ...[
            SizedBox(width: 5),
            Text(
              "${widget.product.oldPrice?.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.star_rounded, color: Colors.amber),
          Text(
            widget.product.rating.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 2.5),
          Text(
            "(${widget.product.reviewsCount.toString()})",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        widget.product.name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        widget.product.category,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.widget});

  final ProductItem widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Hero(
          tag: widget.product.id,
          child: Image.network(
            widget.product.image,
            // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8eUcJILxbLFmKQXfNgofWHjNOD6NhYYgAR712OV4SUA&s=10',
            //'https://wayupsports.com/cdn/shop/files/WH-ULT900NH.jpg?v=1738673891&width=800',
            height: 250,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Row(
          children: [
            if (widget.product.hasDiscount)
              Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("خصم ${widget.product.discountPercentageInt}%"),
                ),
              ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
