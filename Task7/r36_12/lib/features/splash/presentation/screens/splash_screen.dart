import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/widgets/custom_worksans_text.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/radius_size.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_literata_text.dart';
import '../widgets/dot.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      context.go(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.backGroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pizza icon
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: ColorsApp.whiteColor,
                borderRadius: BorderRadius.circular(RadiusSize.borderRadius80),
              ),
              child: Image.asset(Assets.pizzaIconImage),
            ),

            SizedBox(height: 50),

            //text Culinary Heritage
            CustomLiterataText(
              title: "Culinary Heritage",
              color: ColorsApp.darkGreenColor,
              fontSize: Fonts.fontSize35,
              fontWeight: Fonts.fontWeightBold,
            ),

            SizedBox(height: 5),

            //text Bringing the warmth of the home
            CustomWorkSansText(
              title: "Bringing the warmth of the home",
              color: ColorsApp.darkGreyColor,
              fontSize: Fonts.fontSize20,
            ),
            // text kitchen to your modern table.
            CustomWorkSansText(
              title: "kitchen to your modern table.",
              color: ColorsApp.darkGreyColor,
              fontSize: Fonts.fontSize20,
            ),

            SizedBox(height: 210),

            //3 dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [Dot(), Dot(), Dot()],
            ),

            SizedBox(height: 10),

            //text PREPARING INGREDIENTS...
            CustomWorkSansText(
              title: "PREPARING INGREDIENTS...",
              color: ColorsApp.darkGreenColor,
              fontSize: Fonts.fontSize15,
              fontWeight: Fonts.fontWeightBold,
            ),
          ],
        ),
      ),
    );
  }
}
