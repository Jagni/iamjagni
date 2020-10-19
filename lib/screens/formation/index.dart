import 'package:flutter/material.dart';
import 'package:iamjagni/models/formation/index.dart';
import 'package:iamjagni/screens/formation/widgets/card.dart';
import 'package:iamjagni/screens/formation/widgets/year.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';

class FormationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormationScreenState();
}

class FormationScreenState extends State<FormationScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<List<FormationEntry>>(
        builder: (entries, context) {
      return buildPager(entries, context);
    }, selectedStream: (store) {
      return store.formation.entries;
    });
  }

  Widget buildPager(List<FormationEntry> experiences, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: AppLayout.paddingSize),
        child: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedCount(
                      count: experiences[page].data.finishDate.year,
                      duration: Duration(milliseconds: 250),
                    ))),
          ),
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                        color: Theme.of(context).dividerColor, height: 2)),
                PageView(
                  clipBehavior: Clip.none,
                  onPageChanged: (index) {
                    setState(() {
                      page = index;
                    });
                  },
                  children: experiences
                      .map((e) => FormationCard(e, context))
                      .toList(),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
