import 'package:flutter/material.dart';
import 'package:news_app/Screens/home_screen.dart';
import 'package:news_app/Screens/loading_screen.dart';
import 'package:news_app/Screens/news_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
