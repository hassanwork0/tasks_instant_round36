import 'package:flutter/material.dart';
import 'mathbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CalculatorScreen());
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //variables
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  String resultDisplay = '0.0';
  String selectedOperation = '';

  void calculate() {
    //  قراءة النصوص وتحويلها لأرقام
    double? num1 = double.tryParse(firstController.text);
    double? num2 = double.tryParse(secondController.text);

    // التحقق من الأخطاء وتحديث قيمة النتيجة
    if (num1 == null || num2 == null || selectedOperation.isEmpty) {
      resultDisplay = "Error";
    } else {
      //  تنفيذ العمليات الحسابية
      if (selectedOperation == '+') {
        resultDisplay = (num1 + num2).toString();
      } else if (selectedOperation == '-') {
        resultDisplay = (num1 - num2).toString();
      } else if (selectedOperation == '*') {
        resultDisplay = (num1 * num2).toString();
      } else if (selectedOperation == '/') {
        if (num2 == 0) {
          resultDisplay = "Cannot divide by zero";
        } else {
          resultDisplay = (num1 / num2).toString();
        }
      }
    }

    setState(() {});
  }

  void clearAll() {
    firstController.clear();
    secondController.clear();
    resultDisplay = '0.0';
    selectedOperation = '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.calculate, color: Colors.purpleAccent),
            SizedBox(width: 8),
            Text('Calculator', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- إدخال الرقم الأول ---
            const Text('First Number', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            TextFormField(
              controller: firstController,
              decoration: InputDecoration(
                hintText: 'Enter First Number',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF1E2235),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // --- إدخال الرقم الثاني ---
            const Text(
              'Second Number',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: secondController,
              decoration: InputDecoration(
                hintText: 'Enter Second Number',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF1E2235),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // --- فاصل اختيار العملية ---
            Row(
              children: const [
                Expanded(
                  child: Divider(color: Color(0xFF1E2235), thickness: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Choose Operation',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Divider(color: Color(0xFF1E2235), thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // --- أزرار العمليات الأربعة ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MathButton(
                  icon: Icons.add,
                  color: Colors.purpleAccent,
                  onPressed: () => selectedOperation = '+',
                ),
                MathButton(
                  icon: Icons.remove,
                  color: Colors.redAccent,
                  onPressed: () => selectedOperation = '-',
                ),
                MathButton(
                  icon: Icons.close,
                  color: Colors.orangeAccent,
                  onPressed: () => selectedOperation = '*',
                ),
                MathButton(
                  icon: Icons.percent,
                  color: Colors.cyanAccent,
                  onPressed: () => selectedOperation = '/',
                ),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8E54E9), Color(0xFF4776E6)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: calculate,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- زرار Clear ---
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2235),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: clearAll,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Clear',
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // --- فاصل النتيجة ---
            Row(
              children: const [ 
                Expanded(
                  child: Divider(color: Color(0xFF1E2235), thickness: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Result',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Divider(color: Color(0xFF1E2235), thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // --- مربع عرض النتيجة ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2235),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    resultDisplay,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
