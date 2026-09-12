import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void calc({double? num1, double? num2,int? op}){
    switch(op){
      case 1:
        result = (num1! + num2!).toString();
        break;
      case 2:
        result = (num1! - num2!).toString();
        break;
      case 3:
        result = (num1! * num2!).toString();
        break;
      case 4:
        result = (num1! / num2!).toString();
        break;
      default:
        result = "0.0";
        break;
    }
  }
  
  final TextEditingController firstNumController = TextEditingController();
  final TextEditingController secondNumController = TextEditingController();

  String? firstNum;
  String? secondNum;
  String result = "0.0";
  int? operation;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d1933),
      appBar: AppBar(
        backgroundColor: Color(0xff0d1933),
        title: Row(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Icon(Icons.calculate_rounded, color: Color(0xff5d61ef),),
            Text("Calculator" , style: TextStyle(color: Colors.white),textAlign: .center,),
          ],
        ),

      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Number", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.start,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff0f1b33),
                  border: BoxBorder.all(
                    width: 2,
                    color: Color(0xff6379a0),
                  ),
                ),
                child: TextFormField(
                  controller: firstNumController,
                  onChanged: (context)=> firstNum = context,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hint: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.looks_one_outlined, color: Color(0xff9364e9),),
                        Text("Enter First Number", style: TextStyle(color: Color(0xff646e87)),textAlign: TextAlign.start,),
                      ],
                    ),
                    
                  ),
              )),
              Text("Second Number", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.start,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff0f1b33),
                  border: BoxBorder.all(
                    width: 2,
                    color: Color(0xff6379a0),
                  ),
                ),
                child: TextFormField(
                  controller: secondNumController,
                  onChanged: (context)=> secondNum = context,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hint: Row(
                      spacing: 10,
                      children: [
                      Icon(Icons.looks_two_outlined, color: Color(0xff9364e9),),
                      Text("Enter Second Number", style: TextStyle(color: Color(0xff646e87)),textAlign: TextAlign.start,),
                      ],
                    ),
                    
                  ),
              )),
              Row(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 1, indent: 10, height: 50,)),
                Icon(Icons.circle, color: Color(0xff5154ba),size: 7.5,),
                Text("Choose Operation", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),
                Icon(Icons.circle, color: Color(0xff5154ba),size: 7.5,),
                Expanded(child: Divider(color: Colors.grey, thickness: 1, endIndent: 10, height: 50,)),
              ],),

              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: BoxBorder.all(color: Color(0xff8040ff), width: 2)
                  ),
                  child: IconButton(onPressed: (){operation = 1;}, icon: FaIcon(FontAwesomeIcons.plus, color: Color(0xff8040ff),))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: BoxBorder.all(color: Color(0xffee695b), width: 2)
                  ),
                  child: IconButton(onPressed: (){operation = 2;}, icon: FaIcon(FontAwesomeIcons.minus, color: Color(0xffee695b),))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: BoxBorder.all(color: Color(0xffffb61c), width: 2)
                  ),
                  child: IconButton(onPressed: (){operation = 3;}, icon: FaIcon(FontAwesomeIcons.xmark), color: Color(0xffffb61c),)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: BoxBorder.all(color: Color(0xff07a1e9), width: 2)
                  ),
                  child: IconButton(onPressed: (){operation = 4;}, icon: FaIcon(FontAwesomeIcons.divide, color: Color(0xff07a1e9),))),
              ],),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff434eed)
                          ),
                      child: IconButton(
                        color: Color(0xff434eed),
                        onPressed: (){
                          calc(num1: double.parse(firstNum!),num2: double.parse(secondNum!), op: operation!);
                          setState(() {
                          });
                          },
                          icon: Text("= Calculate", style: TextStyle(color: Colors.white, fontSize: 20),)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff17233d)
                          ),
                      child: IconButton(
                        color: Color(0xff17233d),
                        onPressed: (){
                          if(firstNum == null || secondNum == null){
                            throw{
                              Error
                            };
                          }else{
                            firstNumController.clear(); 
                            secondNumController.clear();     
                            firstNum = null;
                            secondNum = null;
                            operation = null;
                            // calc(op: 0);
                          }
                          setState(() {
                          });
                          },
                          icon: Row(
                            mainAxisAlignment: .center,
                            children: [
                              FaIcon(FontAwesomeIcons.trash, color: Colors.red,),
                              Text("  Clear", style: TextStyle(color: Colors.red, fontSize: 20),),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 1, indent: 10, height: 50,)),
                Icon(Icons.circle, color: Color(0xff5154ba),size: 7.5,),
                Text("Result", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),
                Icon(Icons.circle, color: Color(0xff5154ba),size: 7.5,),
                Expanded(child: Divider(color: Colors.grey, thickness: 1, endIndent: 10, height: 50,)),
              ],),
              Container(
                alignment: .center,
                // height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff111d35)
                ),
                child: Text(result, style: TextStyle(color: Colors.white, fontSize: 40),),
              )
            ],),
      ));
  }
}
