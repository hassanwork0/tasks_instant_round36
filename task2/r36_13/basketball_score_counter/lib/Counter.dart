import 'package:basketball_score_counter/main.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String title;
  const Counter({super.key, required this.title});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(widget.title, style: TextStyle(fontSize: 36)),
          SizedBox(height: 20),
          Text(
            "$counter",
            style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +3 Throw",
            onPress: () {
              setState(() {
                counter += 3;
              });
            },
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +2 Throw",
            onPress: () {
              setState(() {
                counter += 2;
              });
            },
          ),
          SizedBox(height: 20),
          MYButton(
            text: " +1 Throw",
            onPress: () {
              setState(() {
                counter += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
