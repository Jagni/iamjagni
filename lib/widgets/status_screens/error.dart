import 'package:flutter/material.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/status.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: AppLayout.maxContentWidth(context) / 5,
            child: ErrorImage()));
  }
}
