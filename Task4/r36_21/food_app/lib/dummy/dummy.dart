import 'package:flutter/material.dart';
import 'package:food_app/Widgets/app_button.dart';
import 'package:food_app/core/colors/colors.dart';
import 'package:food_app/core/images/app_images.dart';

class Dummy{
  static final List<Widget> appCategories = [
                  AppButton(
                    height: 50,
                    width: 75,
                    child: Text("All", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                  AppButton(
                    height: 50,
                    width: 120,
                    color: AppColors.appLiteGrey,
                    child: Text("Combos", style: TextStyle(color: AppColors.appGrey, fontSize: 16),),
                  ),
                  AppButton(
                    height: 50,
                    width: 120,
                    color: AppColors.appLiteGrey,
                    child: Text("Sliders", style: TextStyle(color: AppColors.appGrey, fontSize: 16),),
                  ),
                  AppButton(
                    height: 50,
                    width: 120,
                    color: AppColors.appLiteGrey,
                    child: Text("Classic", style: TextStyle(color: AppColors.appGrey, fontSize: 16),),
                  ),
                ];

  static final List<Map> cardData = [
    {
    'image' : AppImages.image_1,
    'name' : "Cheeseburger",
    'description' : "Wendy's burger",
    'longDesc' : "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    'rating' : "4.9"
    },
    {
    'image' : AppImages.image_2,
    'name' : "Hamburger",
    'description' : "Veggie Burger",
    'longDesc' : "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    'rating' : "4.8"
    },
    {
    'image' : AppImages.image_3,
    'name' : "Hamburger",
    'description' : "Chicken Burger",
    'longDesc' : "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    'rating' : "4.6"
    },
    {
    'image' : AppImages.image_1,
    'name' : "Hamburger",
    'description' : "Fried Chicken burger",
    'longDesc' : "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    'rating' : "4.5"
    },
  ];
}