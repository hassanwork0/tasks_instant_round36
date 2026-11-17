import 'package:burger_store_ui/core/routes/routes.dart';
import 'package:burger_store_ui/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          AppLogo(fontsize: 36 , color:Colors.black),
          Text("Order your favourite food !" , style: TextStyle(color: Colors.grey , fontSize: 16),)
        ],
        ),
        InkWell(
          onTap: () {
            context.push(Routes.login);
          },
          child: Icon(Icons.account_circle_sharp , size: 48))
      ],
    );
  }
}