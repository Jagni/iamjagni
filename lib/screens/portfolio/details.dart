import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:provider/provider.dart';

class PortfolioDetails extends StatelessWidget {
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
            title: Text(project.title),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.screenshots.length > 0)
                  Container(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: project.screenshots[index] ?? "",
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/avatar.png",
                                  fit: BoxFit.contain,
                                ));
                      },
                      itemCount: project.screenshots.length,
                      itemWidth: itemSize,
                      itemHeight: itemSize,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(AppLayout.paddingSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "App para auxílio visual de diagnóstico sobre coisas tais em radiografias.\n\nPermite o desenho de linhas e gera ângulos automaticamente, comparando-os às recomendações da OMS e blablabla"),
                        SizedBox(height: 8),
                        Text(
                          "www.linkparaoapp.com.br",
                          style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                  alignment: WrapAlignment.end,
                                  spacing: 8,
                                  children: List.generate(
                                    5,
                                    (index) => index % 2 == 0
                                        ? Chip(
                                            backgroundColor: backgroundColor,
                                            label: Text(
                                              subjects[_random
                                                  .nextInt(subjects.length)],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))
                                        : Chip(
                                            backgroundColor: primaryColor,
                                            label: Text(
                                              subjects[_random
                                                  .nextInt(subjects.length)],
                                              style: TextStyle(
                                                  color: cardColor,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }
}

final _random = new Random();

final subjects = [
  "Swift",
  "Firebase",
  "CoreGraphics",
  "Augmented Reality",
  "ReactNative",
  "VueJS",
  "Flutter",
  "RxSwift",
  "Objective-C"
];
