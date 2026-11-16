import 'package:counter_app/counters.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: myFloatingButton(context),
      body: SingleChildScrollView(child: Column(children: Counters.counters)),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      title: Text("counter", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.deepPurple,
    );
  }

  Container myFloatingButton(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            TextEditingController name = TextEditingController();
            TextEditingController start = TextEditingController();
            TextEditingController end = TextEditingController();
            TextEditingController inc = TextEditingController();

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.all(32),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        controller: name,
                        decoration: InputDecoration(hint: Text("counter name")),
                      ),

                      TextField(
                        controller: start,
                        decoration: InputDecoration(
                          hint: Text("counter start"),
                        ),
                      ),

                       TextField(
                        controller: end,
                        decoration: InputDecoration(
                          hint: Text("counter end"),
                        ),
                      ),

                      TextField(
                        controller: inc,
                        decoration: InputDecoration(
                          hint: Text("counter increment"),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Counters.counters.add(
                            CounterCard(
                              name: name.text,
                              start: start.text.isEmpty
                                  ? 0
                                  : int.parse(start.text),
                              end: end.text.isEmpty
                                  ? null
                                  : int.parse(end.text),
                              inc: inc.text.isEmpty ? 1 : int.parse(inc.text),
                            ),
                          );

                          setState(() {});

                          Navigator.pop(context);
                        },
                        child: Text("add"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class CounterCard extends StatefulWidget {
  final String name;
  final int start;
  final int? end;
  final int inc;

  const CounterCard({
    super.key,
    required this.name,
    this.start = 0,
    this.inc = 1,
    this.end,
  });

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  late int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.start;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.end == null) {
                    counter += widget.inc;
                  } else if (counter < widget.end!) {
                    counter += widget.inc;
                  }
                });
              },

              icon: Icon(Icons.add),
            ),

            Column(children: [Text(widget.name), Text("$counter")]),

            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.end == null) {
                    counter -= widget.inc;
                  } else if (counter > widget.end! * -1) {
                    counter -= widget.inc;
                  }
                });
              },

              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
