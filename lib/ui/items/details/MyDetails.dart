import 'package:flutter/material.dart';

// Widget that display detail of an item
class MyDetail extends StatelessWidget {
  const MyDetail(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vue de detail'),
      ),
      body: Center(
        child: Text('Détail de $title'),
      ),
    );
  }
}