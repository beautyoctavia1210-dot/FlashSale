import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:Image(image: NetworkImage('https://flutter.github.io/assetsfor-api-docs/assets/widgets/owl.jpg'),
      home:Image(image: NetworkImage('assets/images.jpeg'))
    );
  }
}