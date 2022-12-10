import 'package:flutter/material.dart';
import '../../../data/models/imageData.dart';
import '../../widgets/ImageFromNetworkWithLoader.dart';

// Vue qui affiche les détails d'un élément
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.image}) : super(key: key);

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
      // Image centré, avec un bouton en dessous.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageFromNetworkWithLoader(url: image.url, width: 300, height: 300),
            // Action button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(image.url),
                  ),
                );
              },
              child: const Text('Action'),
            ),
          ],
        ),
      ),
    );
  }
}
