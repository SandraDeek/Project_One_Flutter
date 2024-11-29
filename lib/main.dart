import 'package:flutter/material.dart';
import 'package:sandra_project/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Horsecope Project',
     debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

