import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:photo_view/photo_view.dart';

class PortfolioDetailsPhotos extends StatelessWidget {
  final int initialIndex;
  final Project project;
  const PortfolioDetailsPhotos({Key key, this.initialIndex, this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: PageController(
                  initialPage: initialIndex,
                ),
                itemCount: project.data.screenshots.length,
                itemBuilder: (context, position) {
                  return Container(
                      child: PhotoView(
                          backgroundDecoration:
                              BoxDecoration(color: backgroundColor),
                          heroAttributes: PhotoViewHeroAttributes(
                              tag: project.uid + position.toString()),
                          tightMode: true,
                          maxScale: 1.0,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/error.png",
                              fit: BoxFit.contain,
                            );
                          },
                          imageProvider: CachedNetworkImageProvider(
                              project.data.screenshots[position])));
                },
              ),
            ),
          ],
        ));
  }
}
