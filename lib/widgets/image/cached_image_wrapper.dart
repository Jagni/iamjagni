import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWrapper extends StatelessWidget {
  final String url;

  const CachedImageWrapper({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
              "assets/images/error.png",
              fit: BoxFit.contain,
            ));
  }
}
