import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/data/food_model.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_widget.dart';
import '../cubit/food_cubit.dart';

class RowOfPriceOrderNow extends StatelessWidget {
  final Products product;

  RowOfPriceOrderNow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //price, order now
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //price
            CustomWidget(
              width: 100,
              height: 60,
              child: Center(
                child: CustomText(
                  title: "\$${state.price}",
                  color: whiteColor,
                  fontSize: fontSize25,
                  fontWeight: fontWeightBold,
                ),
              ),
            ),

            //btn order now
            CustomWidget(
              width: 190,
              height: 60,
              color: blackColor,
              child: Center(
                child: CustomText(
                  title: "ORDER NOW",
                  color: whiteColor,
                  fontSize: fontSize20,
                  fontWeight: fontWeightBold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
