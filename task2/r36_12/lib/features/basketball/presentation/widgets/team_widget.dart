import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant.dart';
import '../cubit/counter_cubit.dart';
import 'button_widget.dart';

class TeamWidget extends StatelessWidget {
  final String teamTitle;
  final VoidCallback throw3;
  final VoidCallback throw2;
  final VoidCallback throw1;

  const TeamWidget({
    super.key,
    required this.teamTitle,
    required this.throw3,
    required this.throw2,
    required this.throw1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title Team
        Text(
          teamTitle,
          style: TextStyle(fontSize: fontSize15, color: greyColor),
        ),
        //score
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${teamTitle == "Team A" ? state.counterA : state.counterB}",
                style: TextStyle(fontSize: fontSize55),
              ),
            );
          },
        ),
        //btn throw +3
        ButtonWidget(
          edges: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          btnText: "+3 THROW",
          onPressed: throw3,
        ),
        //btn throw +2
        ButtonWidget(
          edges: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          btnText: "+2 THROW",
          onPressed: throw2,
        ),
        //btn throw +1
        ButtonWidget(
          edges: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          btnText: "+1 THROW",
          onPressed: throw1,
        ),
      ],
    );
  }
}
