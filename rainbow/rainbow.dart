// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boring Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoreWidget(),
    );
  }
}

class CoreWidget extends StatefulWidget {
  const CoreWidget({Key? key}) : super(key: key);

  @override
  State<CoreWidget> createState() => _CoreWidgetState();
}

List<Color> colors = [
  Colors.amber,
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.green,
];

class _CoreWidgetState extends State<CoreWidget> {
  int param = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              SizedBox(height: 30),
              for (int index = 5; index > 0; index--)
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      for (int count = 0; count < index; count++)
                        Container(
                          height: 70,
                          width: 40,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colors[(index + param) % 5],
                          ),
                        ),
                    ],
                  ),
                ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 70,
                    color: Colors.yellow,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          param = (param + 1) % 5;
                        });
                      },
                      child: Text(
                        'Press',
                        style: TextStyle(fontSize: 32, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
