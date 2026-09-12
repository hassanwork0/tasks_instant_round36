import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String result = "0.0";
  var NumberOne = TextEditingController();
  var NumberTwo = TextEditingController();
  double calcResult = 0.0;
  String selectedOperation = "+";

  void calculate() {
    double num1 = double.tryParse(NumberOne.text) ?? 0.0;
    double num2 = double.tryParse(NumberTwo.text) ?? 0.0;

    setState(() {
      if (selectedOperation == "+") calcResult = num1 + num2;
      if (selectedOperation == "-") calcResult = num1 - num2;
      if (selectedOperation == "*") calcResult = num1 * num2;
      if (selectedOperation == "/") {
        if (num2 != 0) {
          calcResult = num1 / num2;
        } else {
          result = "لا يمكن القسمة علي 0";
          return;
        }
      }
      result = calcResult % 1 == 0 ? calcResult.toInt().toString() : calcResult.toString();
    });
  }

  void clearAll() {
    setState(() {
      NumberOne.clear();
      NumberTwo.clear();
      result = "0.0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1626),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                        ).createShader(bounds),
                        child: const Icon(Icons.calculate, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Calculator",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 10),
               Center(child: Text("--------------------------------------",
                  style: TextStyle(color: Color(0xFF7F00FF), fontSize: 16))),
               SizedBox(height: 25),
               Text("First Number", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.w500)),
               SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: NumberOne,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter first number",
                  hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
                  filled: true,
                  fillColor: const Color(0xFF131B2E),
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF7F00FF).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(" 1 ", style: TextStyle(color: Color(0xFF7F00FF), fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFF7F00FF), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text("Second Number", style: TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: NumberTwo,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter second number",
                  hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
                  filled: true,
                  fillColor: const Color(0xFF131B2E),
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE100FF).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(" 2 ", style: TextStyle(color: Color(0xFFE100FF), fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.white12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFE100FF), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white12, endIndent: 10)),
                  Text("Choose Operation", style: TextStyle(color: Colors.white38, fontSize: 13)),
                  Expanded(child: Divider(color: Colors.white12, indent: 10)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOperationButton("+", const Color(0xFF8B5CF6)),
                  _buildOperationButton("-", const Color(0xFFEF4444)),
                  _buildOperationButton("*", const Color(0xFFF59E0B)),
                  _buildOperationButton("/", const Color(0xFF06B6D4)),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7F00FF).withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("=  ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: clearAll,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF131B2E).withOpacity(0.5),
                    side: const BorderSide(color: Colors.white12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_outline, color: Colors.orangeAccent, size: 20),
                      SizedBox(width: 8),
                      Text("Clear", style: TextStyle(color: Colors.orangeAccent, fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white12, endIndent: 10)),
                  Text("Result", style: TextStyle(color: Colors.white38, fontSize: 13)),
                  Expanded(child: Divider(color: Colors.white12, indent: 10)),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFF131B2E),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Center(
                  child: Text(
                    result,
                    style: const TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildOperationButton(String symbol, Color color) {
    bool isSelected = selectedOperation == symbol;
    String displaySymbol = symbol;
    if (symbol == "*") displaySymbol = "×";
    if (symbol == "/") displaySymbol = "÷";

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOperation = symbol;
        });
      },
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: const Color(0xFF131B2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.white12,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: color.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 2))]
              : null,
        ),
        child: Center(
          child: Text(
            displaySymbol,
            style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}