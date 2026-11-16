import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:burger_store_ui/core/widgets/app_buttom.dart';
import 'package:burger_store_ui/features/food_details/presentation/bloc/price_cubit.dart';
import 'package:burger_store_ui/features/food_details/presentation/bloc/price_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});
  
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
  
class _ProductScreenState extends State<ProductScreen> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<PriceCubit, PriceState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductTitleBar(),
                Hero(
                  tag: widget.product.name,
                  child: Image(
                    image: NetworkImage(widget.product.imagePath),
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(widget.product.name, style: TextStyle(fontSize: 32)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text("${widget.product.rating}"),
                    Text(" - ${widget.product.deliveryTime} mins"),
                  ],
                ),

                Text(
                  widget.product.description,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "spicey",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Slider(
                            thumbColor: Colors.red,
                            activeColor: Colors.red,
                            value: sliderValue,
                            min: 0,
                            max: 100,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          spacing: 135,
                          children: [
                            Text("mid" , style: TextStyle(color: Colors.green)),
                            Text("hot" , style: TextStyle(color: Colors.red)),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "portion",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 32,
                          children: [
                            AppButtom(
                              onPressed: () {
                                context.read<PriceCubit>().increment();
                              },
                              width: 50,
                              heigth: 50,
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "${state.counter}",
                              style: TextStyle(fontSize: 24),
                            ),
                            AppButtom(
                              onPressed: () {
                                context.read<PriceCubit>().decrement();
                              },
                              width: 50,
                              heigth: 50,
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButtom(
                      width: 100,
                      child: Text(
                        "\$${state.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),

                    AppButtom(
                      color: Colors.black,
                      width: 200,
                      child: Text(
                        "order now",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductTitleBar extends StatelessWidget {
  const ProductTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Icon(Icons.search),
      ],
    );
  }
}
