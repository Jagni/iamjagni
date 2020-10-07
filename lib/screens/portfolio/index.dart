import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iamjagni/models/portfolio/project.dart';
import 'package:iamjagni/screens/portfolio/store.dart';
import 'package:iamjagni/screens/portfolio/widgets/card.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/blank_slate_screen.dart';
import 'package:iamjagni/widgets/error_screen.dart';
import 'package:iamjagni/widgets/loading_screen.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PortfolioScreenState();
}

class PortfolioScreenState extends State<PortfolioScreen> {
  PortfolioStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mainStore = Provider.of<MainStore>(context, listen: false);
    store = mainStore.portfolio;
    store.setupFirebaseListeners();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: store.projects,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return ErrorScreen();
              break;
            case ConnectionState.waiting:
              return LoadingScreen();
              break;
            case ConnectionState.active:
              if (snapshot.hasData) {
                return buildList(snapshot.data);
              }
              return BlankSlateScreen();
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return buildList(snapshot.data);
              }
              return ErrorScreen();
              break;
          }
          return BlankSlateScreen();
        });
  }

  buildList(List<Project> projects) {
    return Center(
      child: Container(
        width: AppLayout.maxContentWidth(context),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppLayout.maxContentWidth(context) /
                    AppLayout.numberOfContentColumns(context),
                childAspectRatio: 1,
                crossAxisSpacing: AppLayout.paddingSize / 2,
                mainAxisSpacing: AppLayout.paddingSize / 2),
            itemCount: projects.length,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  columnCount: 2,
                  child: SlideAnimation(
                      verticalOffset: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FadeInAnimation(
                            child: PortfolioCard(project: projects[index])),
                      )));
            }),
      ),
    );
  }
}
