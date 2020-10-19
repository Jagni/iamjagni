import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:hexagonal_grid_widget/hex_grid_widget.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:iamjagni/screens/portfolio/widgets/circle.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';

class PortfolioScreen extends StatelessWidget {
  final double _minHexWidgetSize = 0;
  final double _scaleFactor = 0.5;
  final double _densityFactor = 2;
  final double _velocityFactor = 0.3;
  final bool _flatLayout = true;

  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<List<Project>>(builder: (projects, context) {
      return buildList(projects, context);
    }, selectedStream: (store) {
      return store.portfolio.projects;
    });
  }

  buildList(List<Project> projects, BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final containerSize =
                    min(constraints.maxWidth, constraints.maxHeight);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: containerSize,
                      height: containerSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green.withAlpha(100), width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(
                          containerSize / 2,
                        )),
                      ),
                      child: ClipOval(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(containerSize / 2)),
                          ),
                          child: HexGridWidget(
                              children: projects
                                  .map((project) => ProjectCircle(project))
                                  .toList(),
                              hexGridContext: HexGridContext(
                                  _minHexWidgetSize,
                                  containerSize / 3,
                                  _scaleFactor,
                                  _densityFactor,
                                  _velocityFactor,
                                  _flatLayout)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
