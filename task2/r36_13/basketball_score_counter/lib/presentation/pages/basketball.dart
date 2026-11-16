import 'package:basketball_score_counter/presentation/cubit/counter_cubit.dart';
import 'package:basketball_score_counter/presentation/widgets/Counter.dart';
import 'package:basketball_score_counter/presentation/widgets/app_button.dart';
import 'package:basketball_score_counter/presentation/widgets/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Basketball extends StatelessWidget {
  const Basketball({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basketball Score",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Counter(title: "Team A"),
                MYSpacer(),
                Counter(title: "Team B"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MYButton(
                  text: "Undo",
                  onPress: () {
                 context.read<counterCubit>().undo();
                  },
                ),
                MYButton(
                  text: "Reset",
                  onPress: () {
                    context.read<counterCubit>().reset();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
