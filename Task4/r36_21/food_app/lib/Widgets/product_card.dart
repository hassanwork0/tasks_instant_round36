import 'package:flutter/material.dart';
import 'package:food_app/screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.item,
  });

  final Map<dynamic, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return ProductScreen(item: item);
        }));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 7.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.fill,
                    height: 120,
                    width: double.infinity,
                    ),
                ),
              Text(item['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  ),),
              Text(item['description'],
                style: TextStyle(
                  fontSize: 14
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.star, color: Color(0xFFFF9633),),
                    Text(item['rating'])
                  ],),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}