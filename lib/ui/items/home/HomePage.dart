import 'package:flutter/material.dart';

import '../details/MyDetails.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static List<String> items = List<String>.generate(
    1000,
        (i) => 'Élement $i',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma liste d\'éléments'),
      ),
      body: Center(
        child: MyList(items: items),
      ),
    );
  }
}

// Widget that display a list of Strings
class MyList extends StatelessWidget {
  const MyList({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: items.map((e) => MyListItem('Titre $e', 'Sous-Titre $e')).toList()
    );
  }
}


// Widget item clickable and title and subtitle and icon
class MyListItem extends StatelessWidget {
  const MyListItem(this.title, this.subtitle, {Key? key}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.sunny),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyDetail(title)));
      },
    );
  }
}