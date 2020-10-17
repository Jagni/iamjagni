import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:iamjagni/screens/portfolio/widgets/card.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<List<Project>>(builder: (projects, context) {
      return buildList(projects, context);
    }, selectedStream: (store) {
      return store.portfolio.projects;
    });
  }

  buildList(List<Project> projects, BuildContext context) {
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
