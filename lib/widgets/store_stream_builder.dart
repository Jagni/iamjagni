import 'package:flutter/material.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/widgets/status_screens/blank_slate.dart';
import 'package:iamjagni/widgets/status_screens/error.dart';
import 'package:iamjagni/widgets/status_screens/loading.dart';
import 'package:provider/provider.dart';

class StoreStreamBuilder<T> extends StatelessWidget {
  final bool list;
  final Stream<T> Function(MainStore) selectedStream;
  final Widget Function(T, BuildContext) builder;

  const StoreStreamBuilder(
      {Key key,
      @required this.selectedStream,
      @required this.builder,
      this.list = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainStore>(builder: (context, store, widget) {
      return StreamBuilder(
          stream: selectedStream(store),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return ErrorScreen();
                break;
              case ConnectionState.waiting:
                return LoadingScreen();
                break;
              case ConnectionState.active:
                if (list) {
                  if (snapshot.hasData && snapshot.data.length > 0) {
                    return builder(snapshot.data, context);
                  }
                } else if (snapshot.hasData) {
                  return builder(snapshot.data, context);
                }
                return BlankSlateScreen();
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return builder(snapshot.data, context);
                }
                return ErrorScreen();
                break;
            }
            return BlankSlateScreen();
          });
    });
  }
}
