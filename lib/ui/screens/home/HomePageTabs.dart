// Screen permettant d'afficher deux tabs : une liste d'éléments et une vue À propos

// Compare this snippet from lib/ui/screens/home/HomePageTabs.dart:

import 'package:flutter/material.dart';

import 'tabs/AboutTab.dart';
import 'tabs/ListTab.dart';
import 'tabs/LoginTab.dart';

// Screen permettant d'afficher deux tabs : une liste d'éléments et une vue À propos
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomePageScreenState();
}

// State de la page. Il contient les tabs et gère l'affichage
class _HomePageScreenState extends State {
  // Index de l'onglet sélectionné au démarrage de la vue nous initialisons à 0
  // pour afficher le premier onglet
  int _currentIndex = 0;

  // Liste des tabs présent dans la page
  final List<Widget> _children = <Widget>[
    const ListTab(),
    const AboutTab(),
    const LoginTab(),
  ];

  // Liste des titres affiché en haut de la page
  final List<String> _titles = <String>[
    'Liste',
    'À propos',
    'Mon compte',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      // Le contenu de la page est affiché est fonction de l'index de la tab sélectionnée
      body: _children[_currentIndex],

      // BottomNavigationBar permet d'afficher les tabs en bas de la page
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mon Compte',
          ),
        ],
      ),
    );
  }

  // Méthode appelée lorsqu'on clique sur une tab
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
