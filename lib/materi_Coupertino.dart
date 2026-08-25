import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCoupertinoWidget extends StatelessWidget {
  const MyCoupertinoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppBar(title: Text('Contoh Cupertino')),
            CupertinoButton(
              child: Text("Contoh Button"), 
              onPressed: () {},
            ),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}