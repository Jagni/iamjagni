import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget header;
  final Widget content;
  ExpandableContainer({this.header, this.content});

  @override
  State<StatefulWidget> createState() => ExpandableContainerState();
}

class ExpandableContainerState extends State<ExpandableContainer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleTween;
  Animation<double> _rotationTween;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    _rotationTween = Tween(begin: 0.0, end: 0.5).animate(_animationController);
    _scaleTween = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: didTapHeader,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: widget.header),
              RotationTransition(
                  turns: _rotationTween,
                  child: Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).dividerColor)),
            ],
          ),
          Flexible(child: buildContent())
        ],
      ),
    );
  }

  didTapHeader() {
    setState(() {
      _expanded = !_expanded;
    });
    if (_expanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  didTapContent() {
    setState(() {
      _expanded = !_expanded;
    });
    if (_expanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  Widget buildContent() {
    return SizeTransition(
      sizeFactor: _scaleTween,
      child: widget.content,
    );
  }
}
