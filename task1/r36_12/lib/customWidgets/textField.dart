import 'package:flutter/material.dart';

import '../contants.dart';

Widget textField({required String label, required String hint, required String num, required TextEditingController textController}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //First Name
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
        child: Text(label,style: TextStyle(color: textColor),),
      ),
      //Enter First Name
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            gradient: textFieldColor,
            borderRadius: BorderRadius.circular(borderRadius15),
            border: Border.all(
              color: borderColorTextField,
              width: 1.2,
            ),
            boxShadow: [
              // Blue glow
              BoxShadow(
                color: Color(0xFF5F7FE0).withOpacity(0.22),
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),

              // Dark shadow
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: whiteColor,
              fontSize: fontSize18,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,

              contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,

              //prefixIconColor: iconColor,
              prefixIcon: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: iconColor,
                          width: 1.5
                      ),

                    ),
                    child: Center(
                      child: Text(
                        num,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: iconColor,
                            fontWeight: fontWeightBold),),
                    )),
              ),
              hint: Text(hint,style: TextStyle(fontSize: fontSize18,color: hintColor)),



            ),
          ),
        ),
      )

    ],
  );
}
