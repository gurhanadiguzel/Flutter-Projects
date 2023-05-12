// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

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

List<String> people = [
  'Angelina',
  'Megan',
  'Scarlett',
  'Emily',
  'Natasha',
];

List<String> titles = [
  'Hello my dear !',
  'Hello sweety !',
  'My love !',
  'Please, reply me !',
  'About Last Night !'
];

List<String> messages = [
  'a',
  'b',
  'c',
  'd',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lorem ıpsum dolar sit amet',
];

List<Color> colors = [
  Color(0xffF06292),
  Color(0xff4FC2F8),
  Color(0xffB39DDB),
  Colors.red,
  Colors.grey
];

class _CoreWidgetState extends State<CoreWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(size: size),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Inbox',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  for (int i = 0; i < 5; i++)
                    _MailContainer(
                      size: size,
                      color: colors[i],
                      text: messages[4],
                      title: titles[i],
                      name: people[i],
                    ),
                ],
              ),
            ),
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Color(0xffF1F4FB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            IconData(0xf1a9, fontFamily: 'MaterialIcons'),
            size: 28,
          ),
          Icon(
            IconData(0xef42, fontFamily: 'MaterialIcons'),
            size: 28,
          ),
          Icon(
            IconData(0xf0d9, fontFamily: 'MaterialIcons'),
            size: 28,
          ),
          Icon(
            IconData(0xf48c, fontFamily: 'MaterialIcons'),
            size: 28,
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20, top: 40),
      height: 60,
      width: size.width - 40,
      decoration: BoxDecoration(
        color: Color(0xffEEF2FB),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(2, 2),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.menu,
                ),
              ),
              SizedBox(width: 15),
              Text('Search in Mail'),
            ],
          ),
          Container(
            //mainAx
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 15),
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              //mainAxisAlignment: MainAxisAlignment.center,
              child: Text(
                'G',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MailContainer extends StatelessWidget {
  const _MailContainer({
    Key? key,
    required this.size,
    required this.color,
    required this.title,
    required this.text,
    required this.name,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String title;
  final String text;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            print('merababaa');
          },
          child: Container(
            height: 75,
            width: size.width - 40,
            margin: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    child: Text(
                      name.characters.first,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          text,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('11:59 PM'),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        IconData(0xf3dc, fontFamily: 'MaterialIcons'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
