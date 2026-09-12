import 'package:flutter/material.dart';


  //Colors, FontWeight, FontSize, TextControllers
  Color backGroundColorForm = Color(0xff0B1530);
  Color backGroundColorScaffold = Color(0xff040A20);
  Color whiteColor = Colors.white;
  Color labelColor = Color(0xFFC8CAD6);
  Color lineColor = Color(0xFF2A3B63);
  Gradient containerColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,

    colors: [
      Color(0xFF132345),
      Color(0xFF0F1B36),
      Color(0xFF0D1831),
    ],
  );

  Gradient textFieldColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,

    colors: [
      Color(0xFF101C37),
      Color(0xFF0D1730),
      Color(0xFF091126),
    ],
  );
  Color borderColor = Color(0xFF1E2B4D);
  Color borderColorTextField = Color(0xFF4567C9);
  Color textColor = Color(0xFFBCC4DB);
  Color hintColor = Color(0xFF7D8597);
  Color iconColor = Color(0xFF8B5CF6);
  Color roseColor = Color(0xFFFF7B7B);

  FontWeight fontWeightBold = FontWeight.bold;

  double fontSize45 = 45;
  double fontSize30 = 30;
  double fontSize25 = 25;
  double fontSize20 = 20;
  double fontSize18 = 18;
  double fontSize15 = 15;
  double fontSize12 = 12;

  double borderRadius15 = 15;
  double borderRadius10 = 10;

  int selectedOperation = 0;

  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  double result = 0.0;

  bool isDarkMode = true;