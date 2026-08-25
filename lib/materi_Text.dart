import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Pembungkus aplikasi dengan MaterialApp
      title: 'Aplikasi Pertamaku',
      home: Scaffold( // Kerangka dasar halaman dengan AppBar dan body
        appBar: AppBar(
          title: const Text('Aplikasi Pertamaku'),
        ),
        body: const Center(
          child: Text(
            'Hello World',
          ),
        ),
      )
    );
  }
}