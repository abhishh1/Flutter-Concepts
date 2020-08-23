import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FutureDemo extends StatefulWidget {
  @override
  _FutureDemoState createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  @override
  Widget build(BuildContext context) {
    
    Future getData() async {
      final firestore = Firestore.instance;
      QuerySnapshot snapshot =
          await firestore.collection('animated').getDocuments();
      return snapshot.documents;
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          title: Text('Future Demo'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data[index].data['image']),
                          ),
                          title: Text(snapshot.data[index].data['name']),
                        ),
                      );
                    });
              }
            },
          ),
        ));
  }
}
