import 'package:calculator_app/customWidgets/btnCalculate.dart';
import 'package:calculator_app/customWidgets/btnClear.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'contants.dart';
import 'customWidgets/operation.dart';
import 'customWidgets/textDivider.dart';
import 'customWidgets/textField.dart';

class CalculatorScreen extends StatefulWidget {
   CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<CalculatorScreen> {


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backGroundColorScaffold,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: backGroundColorForm,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: borderColor,
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //App Bar
                    Padding(
                      padding:  EdgeInsets.only(right: 20,left:20, top: 30,bottom: 10),
                      child: Row(
                        children: [

                          //image cal
                          Padding(
                            padding:  EdgeInsets.only(left: 70,right: 10),
                            child: Image.asset("assets/icon_calculator.png", height: 25,),
                          ),
                          //text cal
                          Text("Calculator", style: TextStyle(fontSize: fontSize25, color: whiteColor, fontWeight: FontWeight.w600,),),

                          Spacer(),

                          //icon
                          GestureDetector(
                            onTap: changeTheme,
                            child: Container(
                              padding:  EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  borderRadius10,
                                ),
                                border: Border.all(color: borderColor),
                                gradient: containerColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Icon(
                                isDarkMode
                                    ? Icons.light_mode_outlined
                                    : Icons.dark_mode_outlined,
                                color: textColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //frequency image , divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //divider 1
                        Expanded(
                          child: Divider(
                            color: lineColor,
                            thickness: 1,
                            indent: 80,
                            endIndent: 2,
                          ),
                        ),

                        //freq image
                        Image.asset("assets/frequency.png",height: 30,color: iconColor,),

                        //divider 2
                        Expanded(
                          child: Divider(
                            color: lineColor,
                            thickness: 1,
                            indent:2,
                            endIndent: 80,
                          ),
                        ),


                      ],
                    ),
                    //First Number, Enter First Number
                    textField(
                        label: "First Number",
                        hint: "Enter first number",
                        num: "1",
                        textController: textController1),

                    //Second Number, Enter Second Number
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: textField(
                          label: "Second Number",
                          hint: "Enter second number",
                          num: "2",
                          textController: textController2),
                    ),

                    //Choose Operation
                    textDivider(text: "Choose Operation"),

                    //operations
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          operation(
                              icon: Icons.add_rounded,
                              iconColor: iconColor,
                              colorBorderOperation: selectedOperation == 0,
                              onTap: () {
                                setState(() {
                                  selectedOperation = 0;
                                });
                              }),
                          operation(
                            icon: Icons.remove_rounded,
                            iconColor: roseColor,
                            colorBorderOperation: selectedOperation == 1,
                            onTap: () {
                              setState(() {
                                selectedOperation = 1;
                              });
                            },
                          ),
                          operation(
                              icon: Icons.clear_rounded,
                              iconColor: Color(0xFFF7C843),
                              colorBorderOperation: selectedOperation == 2,
                              onTap: () {
                                setState(() {
                                  selectedOperation = 2;
                                });
                              }),
                          operation(
                              icon: CupertinoIcons.divide,
                              iconColor: Color(0xFF22B8FF),
                              colorBorderOperation: selectedOperation == 3,
                              onTap: () {
                                setState(() {
                                  selectedOperation = 3;
                                });
                              }),
                        ],
                      ),
                    ),

                    //btn calculate
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                      child: GestureDetector(
                          onTap: calculateResult,
                          child: btnCalculate()),
                    ),

                    //btn clear
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                          onTap: clearResult,
                          child: btnClear()),
                    ),

                    //Result text
                    textDivider(text: "Result"),

                    //Result container
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: double.infinity,

                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius10),
                            border: Border.all(
                                color: borderColor,
                                width: 1.5
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          gradient: containerColor,


                        ),
                        child: Text("$result",style: TextStyle(color: whiteColor,fontSize: fontSize45,fontWeight: fontWeightBold),textAlign: TextAlign.center,),
                      ),
                    ),

                    SizedBox(height: 35)



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

void calculateResult(){
    double num1 = double.tryParse(textController1.text) ?? 0;
    double num2 = double.tryParse(textController2.text) ?? 0;

    setState(() {
      if (selectedOperation == 0){
        result = num1 + num2;
      }

      else if (selectedOperation == 1){
        result = num1 - num2;
      }

      else if (selectedOperation == 2){
        result = num1 * num2;
      }

      else if (selectedOperation == 3){
        if (num2 != 0){
          result = num1 / num2;
        }
        else{
          result = 0.0;

        }
      }


    });



}

void clearResult(){

    setState(() {
      textController1.clear();
      textController2.clear();

      result = 0.0;

      selectedOperation = 0;

    });
}

void changeTheme() {

    setState(() {

      isDarkMode = !isDarkMode;

      if (isDarkMode) {

        backGroundColorForm = Color(0xff0B1530);
        backGroundColorScaffold = Color(0xff040A20);

        whiteColor = Colors.white;

        containerColor = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,

          colors: [
            Color(0xFF132345),
            Color(0xFF0F1B36),
            Color(0xFF0D1831),
          ],
        );

        textColor = Color(0xFFBCC4DB);

        borderColor = Color(0xFF1E2B4D);

        lineColor = Color(0xFF2A3B63);

        labelColor = Color(0xFFC8CAD6);

        textFieldColor = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,

          colors: [
            Color(0xFF101C37),
            Color(0xFF0D1730),
            Color(0xFF091126),
          ],
        );

      } else {

        backGroundColorForm = Color(0xffF4F7FF);
        backGroundColorScaffold = Colors.white;

        whiteColor = Colors.black;

        containerColor = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,

          colors: [
            Color(0xFFF8FAFF),
            Color(0xFFF1F5FF),
            Color(0xFFEAF1FF),
          ],
        );

        textColor = Colors.black87;

        borderColor = Colors.grey.shade300;

        lineColor = Colors.grey.shade300;

        labelColor = Colors.black;

        textFieldColor = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,

          colors: [
            Color(0xFFFDFEFF),
            Color(0xFFF5F8FF),
            Color(0xFFEEF3FF),
          ],
        );

      }

    });

  }



}
