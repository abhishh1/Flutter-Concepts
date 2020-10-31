import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango/sharedPreferences/Homepage.dart';
import 'package:mango/sharedPreferences/Loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.to(finalEmail == null ? LoginPage() : Homepage()));
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Icon(Icons.local_activity),
            radius: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
