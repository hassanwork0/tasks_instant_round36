import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/contants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/cutom_text_logo.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //text foodgo, text order your , profile image
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //text foodgo, text order your
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text foodgo
              CustomTextLogo(
                title: "Foodgo",
                color: blackColor,
                fontSize: fontSize40,
              ),
              //text order your
              CustomText(
                title: "Order you favourite food!",
                color: textGreyColor,
                fontSize: fontSize20,
              ),
            ],
          ),
          //profile image
          IconButton(
            onPressed: () {
              context.push(Routes.login);
            },
            icon: Icon(Icons.account_circle_rounded, size: 65),
          ),
        ],
      ),
    );
  }
}
