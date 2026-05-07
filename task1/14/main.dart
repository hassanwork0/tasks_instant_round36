import "package:flutter/material.dart" ;
void main(){
  runApp(
    Myapp(),
  );
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Homescreen(),
    );
  }
}
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  double c1=0,c2=0,result=0,data=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text("Calculator",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Icon(Icons.dark_mode,),)

        ],
      ),
      body:
      Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(

            width: double.infinity,
            height: 40,
            child:Padding(padding: EdgeInsets.only(top: 10),
              child:
              Text("-------------------- Your Calculator --------------------",
                style: TextStyle(color: Colors.white, fontSize: 16) ,textAlign: TextAlign.center,),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("First Number",
                  style: TextStyle(color: Colors.white,fontSize: 16)
                  )),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      c1 = double.tryParse(val)??0;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.looks_one_outlined, color: Colors.white60),
                      labelText: " Enter First Number",
                      labelStyle: TextStyle(color:Colors.white),
                      border: OutlineInputBorder(),

                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Second Number",
                      style: TextStyle(color: Colors.white,fontSize: 16)
                  )),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    c2 = double.tryParse(val) ?? 0;
                  },                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.looks_two_outlined, color: Colors.white60),
                    labelText: " Enter Second Number",
                    labelStyle: TextStyle(color:Colors.white),
                    border: OutlineInputBorder(),
                  ),
                )),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: Text(
                  "--------------------Choose Operation --------------------",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(right: 20),
                      child: FloatingActionButton(onPressed: (){

                        setState(() {result=c1+c2;});
                      },
                    child: Text("+",style: TextStyle(fontSize: 40),),)),
                  Padding(padding: EdgeInsets.only(right: 20),
                      child: FloatingActionButton(onPressed: (){

                        setState(() {result=c1-c2;});
                      },
                    child: Text("-",style: TextStyle(fontSize: 40),),)),
                  Padding(padding: EdgeInsets.only(right: 20),
                      child: FloatingActionButton(onPressed: (){

                        setState(() {result=c1*c2;});
                      },
                    child: Text("*",style: TextStyle(fontSize: 40),),)),
                  FloatingActionButton(onPressed: (){

                    setState(() { result=c1/c2;});
                  },
                    child: Text("/",style: TextStyle(fontSize: 40),),),
                ],
              ),
              Center( child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.0),
                child: MaterialButton(
                    onPressed: () {

                      setState(() {data=result;});
                    },
                    color: Colors.white,
                    textColor: Colors.deepPurple[800],
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Text(
                    "= Calculate",
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    ),
                    ),

                          ),
              ),),
              Center( child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.0),
                child: MaterialButton(
                  onPressed: () {

                    setState(() {
                      data=0;
                    });
                  },
                  color: Colors.black12,
                  textColor: Colors.deepPurple[800],
                  padding: EdgeInsets.symmetric(horizontal: 125, vertical: 15),
                  child: Text(
                    "clear",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Text(
                  "---------------------------- Reslt ----------------------------",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    alignment: Alignment.center,
                    width: 310,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                    ),
                    child: Text("$data",style:TextStyle(fontWeight:FontWeight.bold ,fontSize: 30),),
                  )
                  ],
              ),
        ],
      ),
    ],));
  }
}




