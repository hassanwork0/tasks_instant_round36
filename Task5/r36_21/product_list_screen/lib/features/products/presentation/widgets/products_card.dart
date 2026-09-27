import 'package:flutter/material.dart';
import 'package:product_list_screen/features/products/data/product.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 15,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  product.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25)
                        ),
                      child: IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                      ),
                    child: Center(
                      child: Text(
                        '${product.discountPercentageInt}% خصم',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],),
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10 , left: 10 , bottom: 10),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(product.category, style: TextStyle(fontSize: 12, color: Colors.grey), textAlign: TextAlign.end,),
                Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.end,),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("(${product.reviewsCount})", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Text("${product.rating}", style: TextStyle(fontSize: 14, color: Colors.black),),
                    Icon(Icons.star, color: Colors.amber, size: 16,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (product.hasDiscount)
                      Text(
                        '${product.oldPrice} ج.م',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    SizedBox(width: 5),
                    Text(
                      '${product.price} ج.م',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('أضف إلى السلة')),
                        SizedBox(width: 5),
                        Icon(Icons.shopping_cart, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
    );
  }
}//