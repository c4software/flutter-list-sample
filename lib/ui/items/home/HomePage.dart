import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/data/models/imageData.dart';

import '../../../data/services/api.dart';
import '../details/MyDetails.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma liste d\'éléments'),
      ),
      body: const Center(
        child: MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  createState() => _MyListState();
}

// Widget that display a list of Strings
class _MyListState extends State {
  List<ImageData> users = <ImageData>[];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => ImageData.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getUsers();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: users.map((e) => MyListItem(e)).toList()
    );
  }
}


// Widget item clickable and title and subtitle and icon
class MyListItem extends StatelessWidget {
  const MyListItem(this.image, {Key? key}) : super(key: key);

  final ImageData image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image.thumbnailUrl),
      title: Text(image.title),
      subtitle: Text(image.url),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyDetail(image)));
      },
    );
  }
}