import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:iamjagni/screens/portfolio/details.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/widgets/image/circle_image.dart';
import 'package:iamjagni/widgets/double_card.dart';
import 'package:provider/provider.dart';

class PortfolioCard extends StatelessWidget {
  final Project project;

  const PortfolioCard({Key key, this.project}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainStore>(builder: (context, store, widget) {
      return DoubleCard(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return PortfolioDetails(project: project);
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: buildImage(project),
              ),
              SizedBox(height: 8),
              buildTitle(project, context),
            ],
          ),
        ),
      );
    });
  }

  buildImage(Project project) {
    var url = project.data.iconUrl;
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
    final child = Text(
      project.data.title,
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
      maxLines: 1,
    );
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + "title",
        child: child);
  }
}
