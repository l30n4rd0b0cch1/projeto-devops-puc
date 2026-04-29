import 'package:flutter/material.dart';
import 'package:landing_page_devops/pages/home_page.dart';
import 'package:landing_page_devops/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportBnb - Reserve sua Quadra',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}
