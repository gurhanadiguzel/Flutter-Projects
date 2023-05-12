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

List<String> images = [
  'https://i.ytimg.com/vi/DmkoBPxyyeo/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDWCzkvS6abCcn7_LCeHF6zuxCQWA',
  'https://i.ytimg.com/vi/dENgZR11YI4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCI-QiNuAq1Zv1bpU7wR1GdCRA7xw',
  'https://i.ytimg.com/vi/DkAHxvoA2Q8/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCgaZrIYb77t71VM5BAdeYwvyRdSQ',
  'https://i.ytimg.com/vi/Nsuaw8xcGO0/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA0ewNI8DzoDdBd4TcCk87hPvAORA',
];
List<String> titles = [
  'Kurtlar Vadisi - 33. Bolum',
  'Süleyman Çakır \'ın Ölümü ve Polat Alemdar\'ın Babaları İnfaz Etmesi - Kurtlar Vadisi 45.Bölüm',
  'Kurtlar Vadisi - 1. Bolum',
  'Kurtlar Vadisi - 29. Bolum',
];

List<String> shorts = ['Shorts', 'All', 'Mafia', 'Musics', 'Movies'];

List<String> minutes = [
  '1:13:32',
  '1:59:48',
  '1:47:45',
  '1:25:31',
];

class _CoreWidgetState extends State<CoreWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0xff282828),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(size: size),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    for (int index = 0; index < 4; index++)
                      Container(
                        //color: Colors.red,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              width: size.width - 16,
                              height: (size.width - 16) / 1.77,
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.width - 16,
                                    height: (size.width - 16) / 1.77,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      color: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 3),
                                      child: Text(
                                        minutes[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    right: 18,
                                    bottom: 9,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 14, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        margin: EdgeInsets.only(left: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          child: Image.network(
                                            'https://upload.wikimedia.org/wikipedia/tr/thumb/1/1f/Kurtlar-vadisi-eski.jpg/250px-Kurtlar-vadisi-eski.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250,
                                        margin: EdgeInsets.only(left: 6),
                                        //color: Colors.yellow,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              titles[index],
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                'Kurtlar Vadisi - 100M views - 15 years ago',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff979797),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      IconData(0xf1ea,
                                          fontFamily: 'MaterialIcons'),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              NavigationBar(),
            ],
          ),
        ),
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
      margin: EdgeInsets.only(top: 44),
      height: 88,
      decoration: BoxDecoration(
        color: Color(0xff282828),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            height: 38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRect(
                  child: Image.asset(
                    'assets/youtube.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 190,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(0xffC4C4C4).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        IconData(0xf344,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true),
                        color: Colors.white,
                        size: 28,
                      ),
                      Icon(
                        IconData(0xf235, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 28,
                      ),
                      Icon(
                        IconData(0xf34b, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 28,
                      ),
                      Container(
                        width: 26,
                        height: 26,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26),
                          child: Image.network(
                            'https://pbs.twimg.com/media/ENyTz39WwAclPlB?format=jpg&name=large',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //Image.network()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 42,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8, right: 8),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++)
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          shorts[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
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
      width: 359,
      height: 85,
      margin: EdgeInsets.only(
          left: 8, right: 8, bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Color(0xFFC4C4C4).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 73,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xe319, fontFamily: 'MaterialIcons'),
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            width: 73,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xf037, fontFamily: 'MaterialIcons'),
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Explore',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xe195, fontFamily: 'MaterialIcons'),
                  size: 45,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            width: 73,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xf3fb, fontFamily: 'MaterialIcons'),
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Subscribtion',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            width: 73,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(0xf488, fontFamily: 'MaterialIcons'),
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Library',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
