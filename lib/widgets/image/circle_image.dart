import 'package:flutter/material.dart';
import 'package:iamjagni/widgets/image/cached_image_wrapper.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final bool asset;
  const CircleImage({Key key, this.url, this.asset = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
        child: asset
            ? Image.asset(
                url,
                fit: BoxFit.contain,
              )
            : CachedImageWrapper(url: url));
  }
}
