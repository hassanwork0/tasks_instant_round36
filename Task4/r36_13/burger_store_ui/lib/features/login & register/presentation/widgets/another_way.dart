import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class anotherway extends StatelessWidget {
  const anotherway({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white70,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Center(child: Image.asset("assets/google.png", width: 50, height: 50)),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white70,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Center(child: Image.asset("assets/apple.png", width: 50, height: 50)),
      ),
    Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white70,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Center(child: Image.asset("assets/phone.png", width: 50, height: 50)),
      ),
      
    
    ],
    );
  }
}