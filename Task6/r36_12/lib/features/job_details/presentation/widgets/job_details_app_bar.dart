import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/contants.dart';

class JobDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JobDetailsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: greyColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: iconSize25,
            color: appBarIconColor,
          ),
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        //icon bookmark
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border_outlined,
            color: appBarIconColor,
            size: iconSize25,
          ),
        ),

        //icon share
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share_rounded,
            color: appBarIconColor,
            size: iconSize25,
          ),
        ),
      ],
    );
  }
}
