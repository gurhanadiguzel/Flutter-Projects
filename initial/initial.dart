import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Boring Flutter App",
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Hi there!",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 30, bottom: 60),
            child: Text(
              "Join us",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: (size.width - 275) / 2, bottom: 50),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            height: 275,
            width: 275,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(color: Colors.white),
                        height: 60,
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(color: Colors.white),
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "‘Mıkalenceno",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(color: Colors.white),
                        height: 60,
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(color: Colors.white),
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 125,
                height: 75,
                color: Colors.red,
                child: Text(
                  "TAP",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
