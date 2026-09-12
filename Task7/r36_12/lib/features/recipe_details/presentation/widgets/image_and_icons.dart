import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/colors/colors_app.dart';
import '../../../../core/constants/icon_size.dart';

class ImageAndIcons extends StatelessWidget {
  final String image;
  const ImageAndIcons({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon back
            IconButton(
              onPressed: () {
                context.pop();
              },
              style: IconButton.styleFrom(
                backgroundColor: ColorsApp.whiteColor,
                shape: const CircleBorder(),
              ),
              icon: Icon(
                Icons.arrow_back_rounded,
                size: IconSize.iconSize25,
                color: ColorsApp.blackColor,
              ),
            ),

            //icon bookmark
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: ColorsApp.whiteColor,
                shape: const CircleBorder(),
              ),
              icon: Icon(
                Icons.bookmark_border_outlined,
                size: IconSize.iconSize25,
                color: ColorsApp.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
