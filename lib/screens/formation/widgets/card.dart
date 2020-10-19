import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iamjagni/models/formation/index.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/double_card.dart';
import 'package:iamjagni/widgets/image/cached_image_wrapper.dart';

class FormationCard extends StatelessWidget {
  final FormationEntry formation;
  final BuildContext context;

  FormationCard(this.formation, this.context);
  @override
  Widget build(BuildContext context) {
    final content = Flexible(child: Text(formation.data.description));

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 1,
                offset: Offset(0.0, 1.0),
              ),
            ]),
      ),
      SizedBox(height: AppLayout.paddingSize),
      Expanded(
        child: SizedBox(
          width: AppLayout.maxContentWidth(context),
          child: DoubleCard(
            child: SizedBox(
              width: AppLayout.maxContentWidth(context),
              child: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        vertical: AppLayout.paddingSize,
                        horizontal: AppLayout.paddingSize * 2),
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeader(context),
                        SizedBox(
                          height: AppLayout.paddingSize / 2,
                        ),
                        content
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: min(AppLayout.maxContentWidth(context) * 0.15,
                  AppLayout.maxContentHeight(context) * 0.1),
              child: CachedImageWrapper(
                  url: formation.data.icon, fit: BoxFit.contain)),
          SizedBox(width: AppLayout.paddingSize, height: AppLayout.paddingSize),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Text(
                  formation.data.title,
                  style: textTheme.headline4
                      .apply(color: textTheme.bodyText1.color),
                )),
                SizedBox(
                    width: AppLayout.paddingSize / 2,
                    height: AppLayout.paddingSize / 4),
                Flexible(
                    child: Text(
                  formation.data.subtitle,
                  style: textTheme.headline5
                      .apply(color: textTheme.bodyText1.color),
                )),
                SizedBox(
                    width: AppLayout.paddingSize / 2,
                    height: AppLayout.paddingSize / 3),
                Flexible(
                    child: Text(
                  formation.data.subsubtitle,
                  style: textTheme.bodyText1
                      .apply(color: textTheme.headline1.color),
                )),
                SizedBox(
                    width: AppLayout.paddingSize,
                    height: AppLayout.paddingSize / 2),
              ],
            ),
          ),
        ]);
  }
}
