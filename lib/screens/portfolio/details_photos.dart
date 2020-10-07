import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/store.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class PortfolioDetailsPhotos extends StatelessWidget {
  final int initialIndex;
  const PortfolioDetailsPhotos({Key key, this.initialIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainStore>(builder: (context, store, widget) {
      final project = store.portfolio.selectedProject;
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            actionsIconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => {Navigator.pop(context)},
            ),
          ),
          body: PageView.builder(
            controller: PageController(
              initialPage: initialIndex,
            ),
            itemCount: project.screenshots.length,
            itemBuilder: (context, position) {
              return Container(
                  child: PhotoView(
                      maxScale: 2.0,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/error.png",
                          fit: BoxFit.contain,
                        );
                      },
                      imageProvider: CachedNetworkImageProvider(
                          project.screenshots[position])));
            },
          ));
    });
  }
}
