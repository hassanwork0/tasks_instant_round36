import 'package:flutter/material.dart';
import 'package:my_test_app/counter.dart';
void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Basketball(),
    );
  }
}

class Basketball extends StatelessWidget {
  const Basketball({super.key});
  
  @override
  Widget build(BuildContext context) {
     final teamAKey = GlobalKey<CounterState>();
    final teamBKey = GlobalKey<CounterState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball Score', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,
         centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row( children: [ 
        
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Counter(key: teamAKey, title: "Team A"),
          ), 
          Container(
            height: 400,
            width: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Counter(key: teamBKey, title: "Team B"),
          )
                 ],
          
                 ),
        ),
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton(text: 'Undo', onPressed: () {
               teamAKey.currentState?.undo();
                  teamBKey.currentState?.undo();
            }),
            MyButton(text: 'Reset', onPressed: () {
               teamAKey.currentState?.reset();
                  teamBKey.currentState?.reset();
            }),
          
          ],
         ),
       )
      ],)
      )
      ;
    
  }
}


class MyButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed;
  const MyButton({
    required this.text,
    this.color = Colors.orange,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(color: color,onPressed: onPressed,child: 
    SizedBox(
      width: 180,
      height: 40,
      child: Center(child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
    ),
    );
  }
}