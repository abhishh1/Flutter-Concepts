import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango/sharedPreferences/Loginpage.dart';
import 'package:mango/sharedPreferences/Splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Homepage'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello $finalEmail',
            style: TextStyle(fontSize: 26),
          ),
          MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('Remove credentials'),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Get.to(LoginPage());
              })
        ],
      )),
    );
  }
}
