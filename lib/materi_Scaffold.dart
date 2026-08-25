import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  // const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample Code')),
        body: Center(child: Text('You have pressed the button $_count times.')),
        bottomNavigationBar: BottomAppBar(child: Container(height: 50.0)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _count++;
            });
            print('Button pressed $_count times');
          },
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}