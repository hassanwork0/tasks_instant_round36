import 'package:flutter/material.dart';

import '../../../../core/contants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 250,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(borderRadius15),
        boxShadow: [
          BoxShadow(color: borderColor, blurRadius: 19, offset: Offset(0, 4)),
        ],
      ),
      child: TextField(
        style: TextStyle(color: blackColor, fontSize: fontSize13),

        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: fontSize15,
            color: blackColor,
            fontWeight: fontWeightBold,
          ),
          prefixIcon: Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
