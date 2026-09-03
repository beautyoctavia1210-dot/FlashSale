import 'package:flutter/material.dart';

class LayoutingDasar extends StatelessWidget {
  const LayoutingDasar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("Baris atas"),
            SizedBox(height: 8,),
            Row(
              children: [
                const Icon(Icons.star),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: const Text("Berjajar ke samping"),
                )
              ],
            ),
            Container(
              width: 100,
              height: 40,
              color: Colors.deepPurple,
              child: const Center(child: Text('Container', style: TextStyle(color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
}