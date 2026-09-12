import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/contants.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_widget.dart';
import '../cubit/food_cubit.dart';

class RowOfSpicyPortion extends StatelessWidget {
  const RowOfSpicyPortion({super.key});

  @override
  Widget build(BuildContext context) {
    //spicy , portion
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //spicy text, slider, mild, hot
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //spicy text
                  CustomText(
                    title: "Spicy",
                    color: blackColor,
                    fontSize: fontSize15,
                    fontWeight: fontWeightBold,
                  ),
                  SizedBox(height: 10),
                  //slider
                  Slider(
                    padding: EdgeInsets.only(left: 7),
                    min: 0,
                    max: 2,
                    divisions: 2,
                    activeColor: redColor,
                    value: state.spicyValue,

                    onChanged: (double newValue) {
                      context.read<FoodCubit>().changeSpicy(newValue);
                    },
                  ),
                  SizedBox(height: 10),
                  //mild, hot
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //mild
                      CustomText(
                        title: "Mild",
                        color: greenColor,
                        fontSize: fontSize13,
                        fontWeight: fontWeightBold,
                      ),
                      //hot
                      CustomText(
                        title: "Hot",
                        color: redColor,
                        fontSize: fontSize13,
                        fontWeight: fontWeightBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //portion text, mins, num, add
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //portion text
                CustomText(
                  title: "Portion",
                  color: blackColor,
                  fontSize: fontSize15,
                  fontWeight: fontWeightBold,
                ),
                SizedBox(height: 10),
                //mins,num, add
                Row(
                  children: [
                    //mins
                    CustomWidget(
                      color: redColor,
                      borderRadius: borderRadius10,
                      height: 35,
                      width: 35,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.remove_rounded,
                            size: iconSize20,
                            color: whiteColor,
                            fontWeight: fontWeightBold,
                          ),
                          onPressed: () {
                            context.read<FoodCubit>().decrement();
                          },
                        ),
                      ),
                    ),
                    //num
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomText(
                        title: "${state.counter}",
                        color: blackColor,
                        fontSize: fontSize20,
                        fontWeight: fontWeightBold,
                      ),
                    ),
                    //add
                    CustomWidget(
                      color: redColor,
                      borderRadius: borderRadius10,
                      height: 35,
                      width: 35,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_rounded,
                          size: iconSize20,
                          color: whiteColor,
                          fontWeight: fontWeightBold,
                        ),
                        onPressed: () {
                          context.read<FoodCubit>().increment();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
