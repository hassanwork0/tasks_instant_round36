import 'package:flutter/material.dart';

import '../contants.dart';

Widget textDivider({required String text}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      //line 1
      Expanded(
        child: Divider(
          color: lineColor,
          thickness: 1,
          indent: 18,
          endIndent: 5,
        ),
      ),

      //icon circle 1
      Icon(Icons.circle_rounded,size: 5,color: iconColor,),

      //Choose Operation
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
        child: Text(text,style: TextStyle(color: labelColor,fontSize: fontSize12),),
      ),

      //icon circle 2
      Icon(Icons.circle_rounded,size: 5,color: iconColor,),

      //line 2
      Expanded(
        child: Divider(
          color: lineColor,
          thickness: 1,
          indent: 5,
          endIndent: 18,
        ),
      ),


    ],
  );
}
