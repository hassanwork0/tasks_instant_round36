import 'package:flutter/material.dart';
import 'package:food_app/Widgets/app_logo.dart';
import 'package:food_app/core/images/app_images.dart';
import 'package:food_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
      return HomeScreen();
    })),);
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFF939B),
          Color(0xFFEF2A39),
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Center(
          child: AppLogo(color: Colors.white,),
        ),
        Row(
          children: [
            Image(
              image: AssetImage(AppImages.splashImage)
            )
          ]
        )
      ],
    ),
  ),
);

  }
}

