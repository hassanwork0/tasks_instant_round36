import 'package:burger_store_ui/core/widgets/app_buttom.dart';
import 'package:burger_store_ui/features/food/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';


class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchTextField()),
        SizedBox(width: 30),
        AppButtom(
          child: Icon(Icons.tune, size: 32, color: Colors.white),
        ),
      ],
    );
  }
}
