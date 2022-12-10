import 'package:flutter/material.dart';

class ImageFromNetworkWithLoader extends StatelessWidget {
  const ImageFromNetworkWithLoader(
      {Key? key, required this.url, this.width, this.height})
      : super(key: key);

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
