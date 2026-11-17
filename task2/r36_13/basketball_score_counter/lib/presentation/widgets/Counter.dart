import 'package:basketball_score_counter/presentation/cubit/counter_cubit.dart';
import 'package:basketball_score_counter/presentation/cubit/counter_state.dart';
import 'package:basketball_score_counter/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  final String title;
  const Counter({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<counterCubit>();
    final isA = title == "Team A";
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 36)),
          SizedBox(height: 20),
          BlocBuilder<counterCubit, counterState>(
            builder: (context, state) {
              return BlocBuilder<counterCubit, counterState>(
                builder: (context, state) {
                  return Text(
                    "${isA ? state.counterA : state.counterB}",
                    style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
                  );
                },
              );
            },
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +3 Throw",
            onPress: () {
              isA ? myCubit.incrementA(3) : myCubit.incrementB(3);
            },
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +2 Throw",
            onPress: () {
              isA ? myCubit.incrementA(2) : myCubit.incrementB(2);
            },
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +1 Throw",
            onPress: () {
              isA ? myCubit.incrementA(1) : myCubit.incrementB(1);
            },
          ),
        ],
      ),
    );
  }
}
