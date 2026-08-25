import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},   
        ),
      ),
    );
  }
}