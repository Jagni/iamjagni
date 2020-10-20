import 'package:flutter/material.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/widgets/status_screens/blank_slate.dart';
import 'package:iamjagni/widgets/status_screens/error.dart';
import 'package:iamjagni/widgets/status_screens/loading.dart';
import 'package:provider/provider.dart';

class StoreStreamBuilder<T> extends StatefulWidget {
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
  State<StatefulWidget> createState() => StoreStreamBuilderState<T>();
}

class StoreStreamBuilderState<T> extends State<StoreStreamBuilder<T>> {
  MainStore store;
  Stream<T> stream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store ??= Provider.of<MainStore>(context, listen: false);
    stream ??= widget.selectedStream(store);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          final shownWidget = callBuilder(snapshot);
          if (shownWidget != null) {
            return shownWidget;
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return ErrorScreen();
              break;
            case ConnectionState.waiting:
              return LoadingScreen();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              break;
          }
          return BlankSlateScreen();
        });
  }

  Widget callBuilder(AsyncSnapshot snapshot) {
    final data = snapshot.data;
    if (snapshot.hasData && data is T) {
      return widget.builder(data, context);
    }
    return null;
  }
}
