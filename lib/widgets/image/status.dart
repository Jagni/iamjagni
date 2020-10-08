import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/loading.gif", fit: BoxFit.contain);
  }
}

class ErrorImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/error.png", fit: BoxFit.contain);
  }
}
