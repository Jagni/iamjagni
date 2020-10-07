import 'package:flutter/material.dart';
import 'package:iamjagni/utils/layout.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      "assets/images/loading.gif",
      fit: BoxFit.contain,
      width: AppLayout.maxContentWidth(context) / 5,
    )));
  }
}
