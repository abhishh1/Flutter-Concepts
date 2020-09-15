import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(),
      bottomNavigationBar: CustomNavigationBar(
        scaleFactor: 0.1,
        iconSize: 30.0,
        strokeColor: Colors.white,
        selectedColor: Colors.white,
        unSelectedColor: Color(0xff6c788a),
        backgroundColor: Color((0xff040307)),
        currentIndex: currentIndex,
        onTap: (int value){
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          CustomNavigationBarItem(
            icon: EvaIcons.home,
            selectedTitle: 'Home'
          ),
           CustomNavigationBarItem(
            icon: EvaIcons.messageCircle,
            selectedTitle: 'Message'
          ),
           CustomNavigationBarItem(
            icon: EvaIcons.alertTriangle,
            selectedTitle: 'Alert'
          ),
           CustomNavigationBarItem(
            icon: EvaIcons.archiveOutline,
            selectedTitle: 'Archieve'
          )
        ],
      ),
    );
  }
}
