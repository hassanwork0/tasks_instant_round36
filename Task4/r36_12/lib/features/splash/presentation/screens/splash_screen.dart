import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/contants.dart';
import '../../../../core/images.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/cutom_text_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      context.go(Routes.home);
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: backGroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //text foodgo
            Expanded(
              flex: 4,
              child: Center(
                child: CustomTextLogo(
                  title: "Foodgo",
                  color: whiteColor,
                  fontSize: fontSize60,
                ),
              ),
            ),

            Spacer(),

            //images splash 1, splash 2
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  //images splash 1
                  Image.asset(
                    Images.splashImage1,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                  //images splash 2
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 30),
                    child: Image.asset(
                      Images.splashImage2,
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
