import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/models/portfolio/project.dart';
import 'package:iamjagni/screens/portfolio/details.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/widgets/double_card.dart';

class PortfolioCard extends StatelessWidget {
  final Project project;

  const PortfolioCard({Key key, this.project}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DoubleCard(
        child: OpenContainer<bool>(
            closedColor: cardColor,
            openColor: cardColor,
            closedElevation: 0,
            transitionType: ContainerTransitionType.fade,
            openBuilder: (BuildContext context, close) {
              return PortfolioDetails();
            },
            tappable: true,
            closedBuilder: (context, open) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueGrey),
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              );
            }));
  }
}
