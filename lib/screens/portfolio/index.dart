import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/screens/portfolio/widgets/grid_view.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PortfolioScreenState();
}

class PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return PortfolioGridView();
  }
}
