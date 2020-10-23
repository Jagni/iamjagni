import 'package:flutter/material.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/status.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: AppLayout.maxContentWidth(context) / 3, child: ErrorImage()),
        if (message != null)
          SizedBox(
              width: AppLayout.maxContentWidth(context) / 1.5,
              child: Text(
                message,
                textAlign: TextAlign.center,
              ))
      ],
    ));
  }
}
