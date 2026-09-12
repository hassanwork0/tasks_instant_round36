
import 'package:flutter/material.dart';
import 'package:my_test_app/main.dart';

class Counter extends StatefulWidget {
  final String title;
  const Counter({
    super.key,
    required this.title,
  });

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
    int counter = 0;
    final List<int> history = []; 
  void addPoints(int points) {
    setState(() {
      history.add(counter); 
      counter += points;
    });
  }

  void reset() {
    setState(() {
      history.clear();
      counter = 0;
    });
  }

  void undo() {
  setState(() {
    if (history.isNotEmpty) {
      counter = history.removeLast();
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
         Text('$counter', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        MyButton(text: 'Add 1 Point', onPressed: () {
          setState(() {
            
             addPoints(1);
          });
        },),
        const SizedBox(height: 10,),
        MyButton(text: 'Add 2 Point', onPressed: () {
          setState(() {
      
             addPoints(2);
          });
        },),
        const SizedBox(height: 10,),
        MyButton(text: 'Add 3 Point', onPressed: () {
          setState(() {
            
             addPoints(3);
          });
        },),
      ],
    );
  }
}

