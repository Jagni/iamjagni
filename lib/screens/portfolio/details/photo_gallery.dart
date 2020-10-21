import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/status.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProjectPhotoGallery extends StatelessWidget {
  final int initialIndex;
  final Project project;
  const ProjectPhotoGallery({Key key, this.initialIndex, this.project})
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
        body: PhotoViewGallery.builder(
            itemCount: project.data.screenshots.length,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(
                      project.data.screenshots[index],
                      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet),
                  tightMode: true,
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: project.uid + index.toString()));
            },
            loadingBuilder: (context, event) {
              return Center(
                child: SizedBox(
                    width: AppLayout.maxContentWidth(context) / 3,
                    child: LoadingImage()),
              );
            },
            backgroundDecoration: BoxDecoration(color: backgroundColor),
            pageController: PageController(initialPage: initialIndex)));
  }
}
