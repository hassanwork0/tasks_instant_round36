import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counterTeamA = 0;
  int counterTeamB = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball App"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Row(
            children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Team A",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15),
                        textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("$counterTeamA",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50),
                        textAlign: TextAlign.center,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamA += 3;
                          setState(() {});
                        },
                        child: Text("+3 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamA += 2;
                          setState(() {});
                        },
                        child: Text("+2 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamA ++;
                          setState(() {});
                        },
                        child: Text("+1 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],),
              Container(
                height: 350,
                width: 3,
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.grey,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Team B",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15),
                        textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("$counterTeamB",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50),
                        textAlign: TextAlign.center,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamB += 3;
                          setState(() {});
                        },
                        child: Text("+3 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamB += 2;
                          setState(() {});
                        },
                        child: Text("+2 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){
                          counterTeamB ++;
                          setState(() {});
                        },
                        child: Text("+1 Throw", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],),
            ],),
            SizedBox(height: 100,),
            Expanded(
              child: Row(
                children: [ Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 150,
                      child: TextButton(
                        onPressed: (){},
                        child: Text("UNDO", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    SizedBox(width: 10,),
                  Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.rectangle
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: 150,
                        child: TextButton(
                          onPressed: (){
                            counterTeamA = 0;
                            counterTeamB = 0;
                            setState(() {});
                          },
                          child: Text("RESET", style: TextStyle(color: Colors.black),),
                      ),),
                ],
              ),
            )
        ],
      )
    );
  }
}
