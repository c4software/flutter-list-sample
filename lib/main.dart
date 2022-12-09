import 'package:flutter/material.dart';
import 'package:hello_world/style/theme.dart';
import 'ui/items/home/HomePage.dart';

void main() {
  runApp(const MyApp());
}

// MaterialApp is the root of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: const MyHomePage(),
    );
  }
}
