import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Flutter', home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('upperGames').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return new ListView(
                    children: snapshot.data.docs
                        .map((DocumentSnapshot documentSnapshot) {
                  return Dismissible(
                    key: ObjectKey(documentSnapshot.data().keys),
                    onDismissed: (direction) {
                      documentSnapshot.data().remove(index);
                    },
                    direction: DismissDirection.startToEnd,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text(
                          documentSnapshot.data()['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }).toList());
              }
            },
          ),
        ));
  }
}
