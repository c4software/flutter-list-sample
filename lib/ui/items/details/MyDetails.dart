import 'package:flutter/material.dart';

import '../../../data/models/imageData.dart';

// Widget that display detail of an item
class MyDetail extends StatelessWidget {
  const MyDetail(this.image, {Key? key}) : super(key: key);

  final ImageData image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          image.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      // Body with image and action button centered
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image
            Image.network(image.url, width: 300, height: 300),
            // Action button
            ElevatedButton(
              onPressed: () {
                // Action
              },
              child: const Text('Commande'),
            ),
          ],
        ),
      ),
    );
  }
}
