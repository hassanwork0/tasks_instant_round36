import 'package:flutter/material.dart';

void main() {
  runApp( CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  String selectedOperation = "";
  String result = "0.0";

  void calculate() {
    double? num1 = double.tryParse(firstController.text);
    double? num2 = double.tryParse(secondController.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = "Error";
      });

      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text("Please enter valid numbers"),
        ),
      );
      return;
    }

    double finalResult = 0;

    switch (selectedOperation) {
      case "+":
        finalResult = num1 + num2;
        break;

      case "-":
        finalResult = num1 - num2;
        break;

      case "×":
        finalResult = num1 * num2;
        break;

      case "÷":
        if (num2 == 0) {
          setState(() {
            result = "Cannot divide by zero";
          });
          return;
        }
        finalResult = num1 / num2;
        break;

      default:
        setState(() {
          result = "Select Operation";
        });
        return;
    }

    setState(() {
      result = finalResult.toString();
    });
  }

  void clearAll() {
    firstController.clear();
    secondController.clear();

    setState(() {
      selectedOperation = "";
      result = "0.0";
    });
  }

  Widget operationButton(String op) {
    bool isSelected = selectedOperation == op;

    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedOperation = op;
            });
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color:
              isSelected ? Colors.deepPurpleAccent : Colors.white10,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? Colors.redAccent
                    : Colors.white24,
              ),
            ),
            child: Center(
              child: Text(
                op,
                style: TextStyle(
                  fontSize: 26,
                  color: isSelected
                      ? Colors.white
                      : Colors.white70,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1783d5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [

            /// First Number
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              style:  TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter first number",
                hintStyle:  TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Second Number
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              style:  TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter second number",
                hintStyle:  TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

             SizedBox(height: 15),

            /// Operation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                operationButton("+"),
                operationButton("-"),
                operationButton("×"),
                operationButton("÷"),
              ],
            ),

             SizedBox(height: 15),

            /// Calculate Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Text(
                  "= Calculate",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

             SizedBox(height: 12),

            /// Clear Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: clearAll,
                icon:  Icon(Icons.delete
                ,color: Colors.black,),
                label: Text("Clear"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            /// Spacer
             Spacer(),

            /// Result Container
            Center(
              child: Container(
                width: double.infinity,
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    result,
                      textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}