// Écran permettant d'afficher trois onglets : une liste d'éléments, une vue À propos et une vue Mon compte

import 'package:flutter/material.dart';

import 'tabs/AboutTab.dart';
import 'tabs/ListTab.dart';
import 'tabs/LoginTab.dart';

// Écran permettant d'afficher trois onglets : une liste d'éléments, une vue À propos et une vue Mon compte
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomePageScreenState();
}

// State de la page. Il contient les onglets et gère l'affichage
class _HomePageScreenState extends State<HomePageScreen> {
  // Index de l'onglet sélectionné au démarrage de la vue, initialisé à 0
  int _currentIndex = 0;

  // Liste des onglets présents dans la page
  final List<Widget> _children = <Widget>[
    const ListTab(),
    const AboutTab(),
    const LoginTab(),
  ];

  // Liste des titres affichés en haut de la page
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

      // Le contenu de la page est affiché en fonction de l'index de l'onglet sélectionné
      body: _children[_currentIndex],

      // BottomNavigationBar permet d'afficher les onglets en bas de la page
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

  // Méthode appelée lorsqu'on clique sur un onglet
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
