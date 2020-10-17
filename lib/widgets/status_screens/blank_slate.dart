import 'package:flutter/material.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/status.dart';

class BlankSlateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
              width: AppLayout.maxContentWidth(context) / 5,
              child: ErrorImage(),
            ),
          ),
          SizedBox(
            width: AppLayout.maxContentWidth(context) / 2.5,
            child: Text(
              "Ops! Nada por aqui ainda...",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
