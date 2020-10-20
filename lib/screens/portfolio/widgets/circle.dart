import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexagonal_grid/hexagonal_grid.dart';
import 'package:hexagonal_grid_widget/hex_grid_child.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:iamjagni/screens/portfolio/details.dart';
import 'package:iamjagni/widgets/image/circle_image.dart';
import 'package:provider/provider.dart';

class ProjectCircle extends HexGridChild {
  final Project project;
  ProjectCircle(this.project);

  @override
  Widget toHexWidget(BuildContext context, HexGridContext hexGridContext,
      double size, UIHex hex) {
    return Container(
      padding: EdgeInsets.all((hexGridContext.maxSize - size) / 2),
      child: Container(
          width: size,
          height: size,
          child: Card(
              margin: EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size)),
              child: InkWell(
                  onTap: () {
                    final analytics =
                        Provider.of<FirebaseAnalytics>(context, listen: false);
                    analytics.logEvent(
                        name: 'tapped_project',
                        parameters: {'name': project.data.title});
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return PortfolioDetails(project: project);
                    }));
                  },
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(4), child: buildImage(project)),
                  )))),
    );
  }

  @override
  double getScaledSize(
      HexGridContext hexGridContext, double distanceFromOrigin) {
    final scaledSize = hexGridContext.maxSize -
        (distanceFromOrigin * hexGridContext.scaleFactor);
    return max(scaledSize, hexGridContext.minSize);
  }

  Widget buildImage(Project project) {
    var url = project.data.iconUrl;
    final asset = url == null;
    if (asset) {
      url = 'assets/images/avatar.png';
    }
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + 'icon',
        child: CircleImage(url: url, asset: asset));
  }

  Widget buildTitle(Project project, BuildContext context) {
    final child = Text(
      project.data.title,
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + 'title',
        child: child);
  }
}
