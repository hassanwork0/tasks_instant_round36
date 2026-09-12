import 'package:flutter/material.dart';

import '../contants.dart';

Widget btnClear (){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      gradient: containerColor,
      borderRadius: BorderRadius.circular(borderRadius10),
      border: Border.all(
        color: borderColor,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(3, 5),
        ),
      ],


    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icon_clear.png",height: 25),
        //Icon(CupertinoIcons.delete_simple, color: roseColor, size: 15,),
        Padding(
          padding: EdgeInsets.only(left: 3),
          child: Text("Clear",style: TextStyle(color: roseColor,fontSize: fontSize15),),
        ),
      ],
    ),
  );
}