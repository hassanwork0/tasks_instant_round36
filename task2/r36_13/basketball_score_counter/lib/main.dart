import 'package:basketball_score_counter/Counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Basketball());
  }
}

class Basketball extends StatefulWidget {
  const Basketball({super.key});

  @override
  State<Basketball> createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basketball Score",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Counter(title: "team A"),
                MYSpacer(),
                Counter(title: "team B"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MYButton(text: "Undo", onPress: () {}),
                MYButton(
                  text: "Reset",
                  onPress: () {
                    setState(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Basketball()),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MYSpacer extends StatelessWidget {
  const MYSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: 400, color: Colors.grey);
  }
}

class MYButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPress;
  const MYButton({
    required this.text,
    required this.onPress,
    this.color = Colors.orange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPress ?? () {},
      child: SizedBox(
        width: 150,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
