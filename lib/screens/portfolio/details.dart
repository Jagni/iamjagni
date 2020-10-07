import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iamjagni/models/portfolio/project.dart';
import 'package:iamjagni/screens/portfolio/details_photos.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/circle_image.dart';
import 'package:iamjagni/widgets/image/cached_image_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioDetails extends StatelessWidget {
  static const routeName = "PortfolioDetails";
  @override
  Widget build(BuildContext context) {
    final itemSize = min(AppLayout.maxContentWidth(context),
        AppLayout.maxContentHeight(context) * 0.75);
    return Consumer<MainStore>(builder: (context, store, widget) {
      final project = store.portfolio.selectedProject;
      return Scaffold(
          backgroundColor: cardColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text("Detalhes"),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(AppLayout.paddingSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                            Row(
                              children: [
                                SizedBox(width: 44, child: buildImage(project)),
                                SizedBox(width: 4),
                                Expanded(child: buildTitle(project, context)),
                              ],
                            ),
                            SizedBox(height: 8),
                            if (project.screenshots.length > 0)
                              buildScreenshotSlider(project, itemSize, context),
                            if (project.screenshots.length > 0)
                              SizedBox(height: 32),
                            Text(project.description ?? "Sem descrição"),
                            SizedBox(height: 8)
                          ] +
                          buildURLlist(project) +
                          [buildTechnologyChips(project)],
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }

  buildImage(Project project) {
    var url = project.iconUrl;
    final asset = url == null;
    if (asset) {
      url = "assets/images/avatar.png";
    }
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + "icon",
        child: CircleImage(url: url, asset: asset));
  }

  buildTitle(Project project, BuildContext context) {
    final child = Text(project.title,
        style: Theme.of(context).textTheme.headline5.apply(color: Colors.white),
        maxLines: 1);
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + "title",
        child: child);
  }

  buildScreenshotSlider(
      Project project, double itemSize, BuildContext context) {
    return Container(
      child: Swiper(
        onTap: (index) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PortfolioDetailsPhotos(initialIndex: index);
          }));
        },
        itemBuilder: (BuildContext context, int index) {
          return CachedImageWrapper(url: project.screenshots[index]);
        },
        itemCount: project.screenshots.length,
        itemWidth: itemSize,
        itemHeight: itemSize,
        layout: SwiperLayout.TINDER,
      ),
    );
  }

  buildURLlist(Project project) {
    return List.generate(
        project.urls.length,
        (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RichText(
                  text: TextSpan(
                text: project.urls[index].label,
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    launch(project.urls[index].url);
                  },
                style: TextStyle(
                    color: primaryColor, decoration: TextDecoration.underline),
              )),
            ));
  }

  buildTechnologyChips(Project project) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              children: List.generate(
                project.technologies.length,
                (index) => index % 2 == 0
                    ? Chip(
                        backgroundColor: backgroundColor,
                        label: Text(
                          project.technologies[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                    : Chip(
                        backgroundColor: primaryColor,
                        label: Text(
                          project.technologies[index],
                          style: TextStyle(
                              color: cardColor, fontWeight: FontWeight.bold),
                        )),
              )),
        ),
      ],
    );
  }
}
