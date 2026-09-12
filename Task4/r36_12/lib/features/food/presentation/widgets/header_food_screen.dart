import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/contants.dart';

class HeaderFoodScreen extends StatelessWidget {
  const HeaderFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //icon arrow back, icon search
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //icon arrow back
        IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: iconSize20,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        //icon search
        IconButton(
          icon: Icon(
            Icons.search_rounded,
            size: iconSize20,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
