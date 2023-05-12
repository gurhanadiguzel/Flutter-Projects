// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> names = [
  'Votre Story',
  'Adiguzel',
  'Patron',
  'Anil',
];

List<String> images = [
  'assets/votre.png',
  'assets/adiguzel.png',
  'assets/patron.png',
  'assets/anil.png',
];

List<String> places = [
  'Paris',
  'Nigde',
  'Ankara',
  'Istanbul',
];

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

class _CoreWidgetState extends State<CoreWidget> {
  get text => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          appTop(size: size),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  width: size.width,
                  height: 92,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: story(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                      for (int index1 = 0; index1 < 4; index1++)
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Image.asset('assets/avatar.png'),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          names[index1],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 2),
                                        Text(places[index1]),
                                      ],
                                    ),
                                  ]),
                                  Icon(
                                    Icons.more_horiz,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: size.width,
                              height: 375,
                              child: Image.asset(
                                'assets/feed.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/container.png'),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        Image.asset('assets/bullet.png'),
                                      ],
                                    ),
                                    Image.asset('assets/bookmark.png'),
                                  ]),
                            ),
                            SizedBox(height: 5),
                            Container(
                              //color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Aimé par Gabdu et dautres personnes',
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: 'Arthur Hazan ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  'Quel plaisir de retrouver mes étudiants de Web 2 ! Ils ont tellement progressés depuis lannée dernière ! #Proud',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Voir les 10 commentaires',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff000000)
                                                .withOpacity(0.4)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          navigationBar(size: size),
        ],
      ),
    ));
  }
}

class story extends StatelessWidget {
  const story({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.zero,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int index = 0; index < 4; index++)
              Container(
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          color: Colors.purple.shade400,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(images[index]),
                      ),
                    ),
                    Text(names[index],
                        style: TextStyle(fontWeight: FontWeight.w400)),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}

class navigationBar extends StatelessWidget {
  const navigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      decoration: BoxDecoration(
        //color: Colors.red,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.video_library_outlined),
          Icon(Icons.storefront_outlined),
          Icon(Icons.person_outline),
        ],
      ),
    );
  }
}

class appTop extends StatelessWidget {
  const appTop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 46,
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/Instagram_logo.png'),
          Container(
            height: 20,
            width: 92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/add_icon.png')),
                Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/heart.png')),
                Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/share.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
