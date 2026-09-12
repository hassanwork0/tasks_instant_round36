import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SimpleCalc());
  }
}

class SimpleCalc extends StatefulWidget {
  const SimpleCalc({super.key});

  @override
  _SimpleCalcState createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  Color backgroundc = const Color.fromARGB(255, 6, 12, 36);
  Color fieldc = Colors.white;
  double result = 0.0;
  String onscreenresult = "0.0";
  String error = "";
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundc,
        centerTitle: true,
        title: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calculate,
                    color: const Color.fromARGB(255, 101, 145, 247),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: backgroundc == Colors.white
                          ? const Color.fromARGB(255, 6, 12, 36)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  isLight = !isLight;

                  backgroundc = isLight
                      ? Colors.white
                      : const Color.fromARGB(255, 6, 12, 36);

                  fieldc = isLight ? Colors.black : Colors.white;
                });
              },
              icon: Icon(Icons.wb_sunny_outlined, color: Colors.grey),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundc,
      body: Column(
        children: [
          MYSpacer(
            textspacer: "~",
            textsize: 30,
            textcolor: const Color.fromARGB(255, 101, 145, 247),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: fieldc),
              keyboardType: TextInputType.number,
              controller: num1,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.looks_one,
                  color: Color.fromARGB(255, 101, 145, 247),
                ),
                labelText: "first number",
                hintText: "enter first number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: fieldc),
              keyboardType: TextInputType.number,
              controller: num2,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.looks_two,
                  color: Color.fromARGB(255, 101, 145, 247),
                ),
                labelText: "second number",
                hintText: "enter second number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          MYSpacer(
            textspacer: "Choose operation",
            textcolor: Colors.grey,
            textsize: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 15, 30, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (num1.text.isEmpty || num2.text.isEmpty) {
                          error = "Error";
                        } else {
                          result =
                              double.parse(num1.text) + double.parse(num2.text);
                          error = "";
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 15, 30, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (num1.text.isEmpty || num2.text.isEmpty) {
                          error = "Error";
                        } else {
                          result =
                              double.parse(num1.text) - double.parse(num2.text);
                          error = "";
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 15, 30, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "X",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (num1.text.isEmpty || num2.text.isEmpty) {
                          error = "Error";
                        } else {
                          result =
                              double.parse(num1.text) * double.parse(num2.text);
                          error = "";
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 15, 30, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (num1.text.isEmpty || num2.text.isEmpty) {
                          error = "Error";
                        } else if (double.parse(num2.text) == 0) {
                          error = "Error";
                        } else {
                          result =
                              double.parse(num1.text) / double.parse(num2.text);
                          error = "";
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(5),
            child: MaterialButton(
              minWidth: double.maxFinite,
              height: 50,
              color: Color.fromARGB(255, 101, 145, 247),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "= calculate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (error.isNotEmpty) {
                  onscreenresult = error;
                } else {
                  onscreenresult = result.toString();
                }
                setState(() {});
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: MaterialButton(
                  minWidth: double.maxFinite,
                  height: 50,
                  color: Color.fromARGB(255, 21, 33, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_forever_outlined, color: Colors.red),
                      SizedBox(width: 5),
                      Text(
                        "clear",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    onscreenresult = "0.0";
                    num1.clear();
                    num2.clear();
                    setState(() {});
                  },
                ),
              ),
              MYSpacer(
                textspacer: "result",
                textcolor: Colors.grey,
                textsize: 15,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 21, 33, 60),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      onscreenresult,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MYSpacer extends StatelessWidget {
  final String textspacer;
  final double textsize;
  final Color textcolor;
  const MYSpacer({
    super.key,
    required this.textspacer,
    required this.textsize,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(child: Container(height: 2, color: Colors.grey)),

          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  textspacer,
                  style: TextStyle(color: textcolor, fontSize: textsize),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Container(height: 2, color: Colors.grey)),
        ],
      ),
    );
  }
}
