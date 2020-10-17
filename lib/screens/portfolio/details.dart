import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
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
  final Project project;
  const PortfolioDetails({Key key, this.project}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _itemProportion = AppLayout.screenIsLarge(context) ? 4 : 1.5;
    final itemSize = AppLayout.maxContentWidth(context) / _itemProportion;
    return Consumer<MainStore>(builder: (context, store, widget) {
      return Scaffold(
          backgroundColor: theme.cardColor,
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            title: Text("Detalhes"),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: AppLayout.maxContentWidth(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppLayout.paddingSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 44, child: buildImage(project)),
                                    SizedBox(width: 4),
                                    Expanded(
                                        child: buildTitle(project, context)),
                                  ],
                                ),
                                SizedBox(height: 8),
                                if (project.data.screenshots != null)
                                  SizedBox(height: 16),
                                if (project.data.screenshots != null)
                                  buildScreenshotSlider(
                                      project, itemSize, context),
                                if (project.data.screenshots != null)
                                  SizedBox(height: 24),
                                Text(project.data.description ??
                                    "Sem descrição"),
                                SizedBox(height: 8)
                              ] +
                              buildURLlist(project, context) +
                              [buildTechnologyChips(project, context)],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
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
    final child = Text(project.data.title,
        style: Theme.of(context).textTheme.headline5, maxLines: 1);
    return Hero(
        transitionOnUserGestures: true,
        tag: project.uid + "title",
        child: child);
  }

  buildScreenshotSlider(
      Project project, double itemSize, BuildContext context) {
    return SizedBox(
      height: itemSize,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: project.data.screenshots.length,
        clipBehavior: Clip.none,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1,
            mainAxisSpacing: AppLayout.paddingSize),
        itemBuilder: (BuildContext context, int index) {
          return Hero(
              tag: project.uid + index.toString(),
              child: Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return PortfolioDetailsPhotos(
                                  initialIndex: index,
                                  project: project,
                                );
                              }));
                    },
                    child: CachedImageWrapper(
                      url: project.data.screenshots[index],
                      fit: BoxFit.contain,
                    ),
                  )));
        },
      ),
    );
  }

  List<Widget> buildURLlist(Project project, BuildContext context) {
    if (project.data.urls == null) return [];
    return List.generate(
        project.data.urls.length,
        (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RichText(
                  text: TextSpan(
                text: project.data.urls[index].label,
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    launch(project.data.urls[index].url);
                  },
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              )),
            ));
  }

  Widget buildTechnologyChips(Project project, BuildContext context) {
    if (project.data.tech == null) return Container(height: 0);
    return Row(
      children: [
        Expanded(
          child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              children: List.generate(
                project.data.tech.length,
                (index) => index % 2 == 0
                    ? Chip(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        label: Text(
                          project.data.tech[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                    : Chip(
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text(
                          project.data.tech[index],
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontWeight: FontWeight.bold),
                        )),
              )),
        ),
      ],
    );
  }
}
