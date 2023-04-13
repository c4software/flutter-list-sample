import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_world/data/models/loginData.dart';
import 'package:hello_world/data/services/api.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  createState() => _LoginTabState();
}

class _LoginTabState extends State {
  LoginData? _data;
  bool _loading = false;

  String _username = 'kminchelle';
  String _password = '0lelplR';

  // Fonction appelée lors de la connexion
  // Elle appelle l'API pour se connecter
  // Si la connexion est réussie, on affiche les informations de l'utilisateur
  _getData() async {
    API.login(_username, _password).then((response) {
      setState(() {
        _data = LoginData.fromJson(json.decode(response.body));
        _loading = false;
      });
    }).catchError((error) {
      _loading = false;
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      // Loader
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_data != null) {
      // L'utilisateur est connecté, on affiche ses informations
      // La widget AuthUserInformationWidget est définie plus bas
      // Il possède un bouton pour se déconnecter, celui-ci appelle la fonction onLogout.
      return AuthUserInformationWidget(
          loginData: _data!,
          onLogout: () {
            setState(() {
              _data = null;
            });
          });
    } else {
      // Formulaire de connexion, FormAuthWidget est définie plus bas
      // Il possède un bouton pour se connecter, celui-ci appelle la fonction onLogin.
      // Lors du changement de valeur du champ login, la fonction onLoginChange est appelée
      // Lors du changement de valeur du champ password, la fonction onPasswordChange est appelée
      return FormAuthWidget(
        onLogin: () {
          setState(() {
            _loading = true;
          });
          _getData();
        },
        onPasswordChange: (value) {
          setState(() {
            _password = value;
          });
        },
        onLoginChange: (value) {
          setState(() {
            _username = value;
          });
        },
      );
    }
  }
}

/// Widget permettant à l'utilisateur de se connecter
/// Il contient un formulaire de connexion et un bouton pour se connecter
///
/// Il est possible de passer des fonctions en paramètres pour gérer les évènements
///
/// onLoginChange : appelée lors du changement de valeur du champ login
/// onPasswordChange : appelée lors du changement de valeur du champ password
/// onLogin : appelée lors du clic sur le bouton de connexion
///
/// Les fonctions onLoginChange et onPasswordChange permettent de récupérer les valeurs des champs
class FormAuthWidget extends StatelessWidget {
  const FormAuthWidget(
      {Key? key,
      required this.onLogin,
      required this.onPasswordChange,
      required this.onLoginChange})
      : super(key: key);

  final Function onLogin;
  final Function onPasswordChange;
  final Function onLoginChange;

  final _initiialLogin = "kminchelle";
  final _initialPassword = "0lelplR";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Authentification',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _initiialLogin,
                onChanged: (value) {
                  onLoginChange(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _initialPassword,
                onChanged: (value) {
                  onPasswordChange(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  onLogin();
                },
                child: const Text('Je me connecte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget affichant les informations de l'utilisateur connecté
/// Il contient le nom et le prénom de l'utilisateur et un bouton pour se déconnecter
///
/// - loginData : les informations de l'utilisateur
/// - onLogout : fonction appelée lors du clic sur le bouton de déconnexion
///
class AuthUserInformationWidget extends StatelessWidget {
  const AuthUserInformationWidget(
      {Key? key, required this.loginData, required this.onLogout})
      : super(key: key);

  final LoginData loginData;
  final Function onLogout;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenue ${loginData.firstName} ${loginData.lastName}',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          Text(
            'Vous êtes connecté',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onLogout();
            },
            child: const Text('Déconnexion'),
          ),
        ],
      ),
    );
  }
}
