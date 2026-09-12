import 'package:flutter/material.dart';

import '../contants.dart';

Widget operation({required IconData icon, required Color iconColor, required bool colorBorderOperation, required VoidCallback onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius15),
        border: Border.all(
            color: colorBorderOperation ? iconColor : borderColor,
            width: 1.5
        ),
        gradient: containerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon,color: iconColor,size: 30,fontWeight: fontWeightBold,),
    ),
  );
}
