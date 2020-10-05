import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/utils/layout.dart';

class PortfolioDetails extends StatelessWidget {
  final int index;

  const PortfolioDetails({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemSize = min(AppLayout.maxContentWidth(context),
        AppLayout.maxContentHeight(context) * 0.75);
    return Scaffold(
        backgroundColor: cardColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Teste"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return index % 2 != 0
                        ? Image.asset(
                            "assets/images/avatar.png",
                            fit: BoxFit.contain,
                          )
                        : Image.asset("assets/images/0.jpg",
                            fit: BoxFit.contain);
                  },
                  itemCount: 3,
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
