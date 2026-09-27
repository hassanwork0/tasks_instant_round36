import 'package:flutter/material.dart';
import 'package:food_app/Widgets/app_button.dart';
import 'package:food_app/core/colors/colors.dart';

class ProductScreen extends StatefulWidget {
  final Map item;
  const ProductScreen({super.key, required this.item});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int portionCount = 1;
  double spicyLevel = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search_rounded),
                ),
              ],),
            
            // Product Image
            Image.asset(widget.item['image'],
              fit: BoxFit.fill,
              height: 300,
              width: double.infinity,
            ),
            // Name and Description
            Row(
              spacing: 5,
              children: [
                Text(widget.item['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),),
                Text(widget.item['description'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),),
              ],
            ),
            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.star, color: Color(0xFFFF9633),),
                  Text(widget.item['rating'])
                ],),
          ]),
            // Description          
            Text(widget.item['longDesc'],
              style: TextStyle(
                fontSize: 14
              ),),

            // Spicy Level and Portion Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Spicy Level"),
                    Slider(
                      activeColor: AppColors.appRed,
                      inactiveColor: AppColors.appGrey,
                      thumbColor: AppColors.appRed,
                      max: 2,
                      value: spicyLevel,
                      onChanged: (newValue) {
                        spicyLevel = newValue;
                        setState(() {
                        });
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mild", style: TextStyle(color: Colors.green),),
                          Text("Hot", style: TextStyle(color: Colors.red),)
                      ],),
                    )
                  ],),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                  ),
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Portion"),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.remove, color: Colors.white,),
                          onPressed: (){
                            if(portionCount > 1){
                              setState(() {
                                portionCount--;
                              });
                            }
                          },
                        ),
                        Text("$portionCount"),
                        AppButton(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.add, color: Colors.white,),
                          onPressed: (){                          
                            setState(() {
                              portionCount++;
                            });
                          },
                        ),
                    ],),
                  ],),
                ),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  height: 70,
                  width: 110,
                  color: Colors.red,
                  child: Text("\$8.24", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                AppButton(
                  height: 70,
                  width: 200,
                  color: AppColors.appDarkGrey,
                  child: Text("ORDER NOW", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
            ],),
          ],
        ),
      ),

    );
  }
}