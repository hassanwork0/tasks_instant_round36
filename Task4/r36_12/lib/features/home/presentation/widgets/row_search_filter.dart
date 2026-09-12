import 'package:flutter/material.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_widget.dart';
import 'search_text_field.dart';

class RowSearchFilter extends StatelessWidget {
  const RowSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    //search bar, icon filter
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //search bar
          SearchTextField(),

          //icon filter
          CustomWidget(
            child: Icon(Icons.tune, size: iconSize30, color: whiteColor),
          ),
        ],
      ),
    );
  }
}
