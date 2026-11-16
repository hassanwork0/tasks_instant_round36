import 'package:burger_store_ui/core/images/AppImages.dart';
import 'package:burger_store_ui/core/routes/routes.dart';
import 'package:burger_store_ui/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () => context.pushReplacement(Routes.home),
    );

    return Scaffold(
      backgroundColor: Color(0xffef2a39),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Center(child: AppLogo())),
          Expanded(
            flex: 1,
            child: Row(
              children: [Image(image: AssetImage(AppImages.splashimage))],
            ),
          ),
        ],
      ),
    );
  }
}
