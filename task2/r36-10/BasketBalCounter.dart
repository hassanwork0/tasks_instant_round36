import 'package:flutter/material.dart';

void main() {
  runApp(BasketBalCounter());
}

class BasketBalCounter extends StatelessWidget {
  const BasketBalCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasketBalHome(),
    );
  }
}

class BasketBalHome extends StatefulWidget {
  const BasketBalHome({super.key});

  @override
  State<BasketBalHome> createState() => _BasketBalHomeState();
}

class _BasketBalHomeState extends State<BasketBalHome> {
  int countTeamA=0;
  int countTeamB=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BasketBalCounter", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Team A"),
                  Text("$countTeamA"),
                  MaterialButton(onPressed: () {
                    countTeamA+=3;
                    setState(() {});
                  }, child: Text("+3Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                  SizedBox(height: 20),
                  MaterialButton(onPressed: () {
                    countTeamA+=2;
                    setState(() {});
                  }, child: Text("+2Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                  SizedBox(height: 20),
                  MaterialButton(onPressed: () {
                    countTeamA++;
                    setState(() {});
                  }, child: Text("+1Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                ],
              ),
              SizedBox(width: 40),
              Container(width: 1, height: 300, color: Colors.grey),
              SizedBox(width: 40),
              Column(
                children: [
                  Text("Team B"),
                  Text("$countTeamB"),
                  MaterialButton(onPressed: () {
                    countTeamB+=3;
                    setState(() {});
                  }, child: Text("+3Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                  SizedBox(height: 20),
                  MaterialButton(onPressed: () {
                    countTeamB+=2;
                    setState(() {});
                  }, child: Text("+2Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                  SizedBox(height: 20),
                  MaterialButton(onPressed: () {
                    countTeamB ++;
                    setState(() {});
                  }, child: Text("+1Throw", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(onPressed: () {}, child: Text("Undo", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
              MaterialButton(onPressed: () {
                countTeamA =0;
                countTeamB =0;
                setState(() {});
              }, child: Text("Reset", style: TextStyle(fontWeight: FontWeight.bold)), minWidth: 150, height: 50, color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}