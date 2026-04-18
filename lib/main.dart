import 'package:flutter/material.dart';
import 'package:landing_page_devops/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color(0xFF8B0000))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
