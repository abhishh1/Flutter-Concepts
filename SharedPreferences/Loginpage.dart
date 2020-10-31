import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mango/sharedPreferences/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Login Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                ),
              ),
              MaterialButton(
                  color: Colors.redAccent,
                  child: Text(
                    'Login',
                  ),
                  onPressed: () async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', emailController.text);

                    Get.to(Homepage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
