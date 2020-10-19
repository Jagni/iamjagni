import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class DoubleCard extends StatelessWidget {
  final void Function() onTap;
  final double borderRadius;
  final double backgroundCardInset;
  final Color backgroundCardColor;
  final Color foregroundCardColor;
  final DoubleCardBackgroundAlignment backgroundCardAlignment;
  final Widget child;

  const DoubleCard(
      {Key key,
      this.borderRadius = 10.0,
      this.child,
      this.backgroundCardInset = 10.0,
      this.backgroundCardAlignment = DoubleCardBackgroundAlignment.bottomRight,
      this.backgroundCardColor,
      this.foregroundCardColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: <Widget>[
      Positioned.fill(
          top: backgroundCardTop,
          right: backgroundCardRight,
          bottom: backgroundCardBottom,
          left: backgroundCardLeft,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              elevation: 5,
              shadowColor: backgroundCardColor != null
                  ? TinyColor(backgroundCardColor).lighten(10).color
                  : TinyColor(theme.primaryColor).lighten(10).color,
              color: backgroundCardColor ?? theme.primaryColor)),
      Positioned.fill(
        top: backgroundCardBottom / 2,
        right: backgroundCardLeft / 2,
        bottom: backgroundCardTop / 2,
        left: backgroundCardRight / 2,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            color: foregroundCardColor ?? theme.cardColor,
            child: Container(
                child: InkWell(
              onTap: onTap,
              highlightColor: TinyColor(theme.cardColor).brighten(8).color,
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((borderRadius))),
              child: child,
            ))),
      )
    ]);
  }

  double get backgroundCardTop {
    switch (backgroundCardAlignment) {
      case DoubleCardBackgroundAlignment.topLeft:
        return 0.0;
      case DoubleCardBackgroundAlignment.topRight:
        return 0.0;
      case DoubleCardBackgroundAlignment.bottomRight:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.bottomLeft:
        return backgroundCardInset;
    }
    return 0.0;
  }

  double get backgroundCardRight {
    switch (backgroundCardAlignment) {
      case DoubleCardBackgroundAlignment.topLeft:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.topRight:
        return 0.0;
      case DoubleCardBackgroundAlignment.bottomRight:
        return 0.0;
      case DoubleCardBackgroundAlignment.bottomLeft:
        return backgroundCardInset;
    }
    return 0.0;
  }

  double get backgroundCardBottom {
    switch (backgroundCardAlignment) {
      case DoubleCardBackgroundAlignment.topLeft:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.topRight:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.bottomRight:
        return 0.0;
      case DoubleCardBackgroundAlignment.bottomLeft:
        return 0.0;
    }
    return 0.0;
  }

  double get backgroundCardLeft {
    switch (backgroundCardAlignment) {
      case DoubleCardBackgroundAlignment.topLeft:
        return 0.0;
      case DoubleCardBackgroundAlignment.topRight:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.bottomRight:
        return backgroundCardInset;
      case DoubleCardBackgroundAlignment.bottomLeft:
        return 0.0;
    }
    return 0.0;
  }
}

enum DoubleCardBackgroundAlignment {
  topLeft,
  topRight,
  bottomRight,
  bottomLeft
}
