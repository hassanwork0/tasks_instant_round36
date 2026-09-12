import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant.dart';
import '../cubit/counter_cubit.dart';
import '../widgets/button_widget.dart';
import '../widgets/team_widget.dart';

class BasketballScreen extends StatelessWidget {
  const BasketballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        elevation: 2,
        shadowColor: blackColor,
        title: Text(
          "Basketball Score",
          style: TextStyle(color: blackColor, fontWeight: fontWeightBold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Team A, Team B
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Team A
                  TeamWidget(
                    teamTitle: 'Team A',
                    throw3: () {
                      myCubit.incrementA(3);
                    },
                    throw2: () {
                      myCubit.incrementA(2);
                    },
                    throw1: () {
                      myCubit.incrementA(1);
                    },
                  ),

                  //vertical line
                  VerticalDivider(
                    color: Colors.grey,
                    indent: 5,
                    endIndent: 310,
                  ),

                  //Team B
                  TeamWidget(
                    teamTitle: 'Team B',
                    throw3: () {
                      myCubit.incrementB(3);
                    },
                    throw2: () {
                      myCubit.incrementB(2);
                    },
                    throw1: () {
                      myCubit.incrementB(1);
                    },
                  ),
                ],
              ),
            ),
          ),

          //btn undo, btn reset
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //btn undo
                ButtonWidget(
                  edges: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  btnText: "UNDO",
                  onPressed: context.read<CounterCubit>().undo,
                ),

                //btn reset
                ButtonWidget(
                  edges: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  btnText: "RESET",
                  onPressed: context.read<CounterCubit>().reset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
