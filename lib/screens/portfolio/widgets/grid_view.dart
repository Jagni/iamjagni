import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iamjagni/models/firebase/dao.dart';
import 'package:iamjagni/models/portfolio/project.dart';
import 'package:iamjagni/screens/portfolio/widgets/card.dart';
import 'package:iamjagni/utils/layout.dart';

class PortfolioGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PortfolioGridViewState();
}

class PortfolioGridViewState extends State<PortfolioGridView> {
  Stream<List<DocumentSnapshot>> stream;
  @override
  void initState() {
    super.initState();
    stream = FirestoreDAO.trackAllDocuments(collectionPath: Project.pluralName);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          List<DocumentSnapshot> snaps = snapshot.data ?? [];
          List<Project> projects =
              snaps.map((doc) => Project.withDoc(doc)).toList();
          projects.sort();
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
                  padding:
                      EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
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
                                  child:
                                      PortfolioCard(project: projects[index])),
                            )));
                  }),
            ),
          );
        });
  }
}
