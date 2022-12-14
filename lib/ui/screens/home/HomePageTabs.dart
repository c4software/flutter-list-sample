// Screen permettant d'afficher deux tabs : une liste d'éléments et une vue À propos

// Compare this snippet from lib/ui/screens/home/HomePageTabs.dart:

import 'package:flutter/material.dart';

import 'tabs/AboutTab.dart';
import 'tabs/ListTab.dart';

// Screen permettant d'afficher deux tabs : une liste d'éléments et une vue À propos
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomePageScreenState();
}


// State de la page. Il contient les tabs et gère l'affichage
class _HomePageScreenState extends State {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    const ListTab(),
    const AboutTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma liste d\'éléments'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'À Propos',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}