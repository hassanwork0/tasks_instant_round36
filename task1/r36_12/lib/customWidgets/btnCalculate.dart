import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../contants.dart';

Widget btnCalculate(){
  return Container(
    //height: double.infinity,
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(3, 5),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          Color(0xFF8B3DFF),
          Color(0xFF2D7BFF),
        ],
      ),


    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.equal, color: whiteColor, size: 25,),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text("Calculate",style: TextStyle(color: whiteColor,fontSize: fontSize20),),
        ),
      ],
    ),
  );
}