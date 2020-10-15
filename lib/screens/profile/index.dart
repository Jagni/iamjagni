import 'package:flutter/material.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/utils/layout.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/profile.png",
            fit: BoxFit.contain,
            width: headerSize,
            alignment: Alignment.bottomCenter,
          ),
        ),
        SizedBox(
          width: headerSize,
          child: DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController controller) {
              return CustomScrollView(
                controller: controller,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    primary: false,
                    floating: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Card(
                      elevation: 5,
                      borderOnForeground: false,
                      color: primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(AppLayout.paddingSize),
                        child: Column(
                          children: [
                            Text(
                              "Jagni Dasa Horta Bezerra",
                              style: theme.textTheme.headline6,
                            ),
                            Text(
                              "• Mobile Developer •",
                              style: theme.textTheme.subtitle1
                                  .apply(color: theme.cardColor),
                            ),
                          ],
                        ),
                      ),
                    )),
                    expandedHeight: 100,
                    collapsedHeight: 100,
                    snap: true,
                    backgroundColor: Colors.transparent,
                    actionsIconTheme: IconThemeData.fallback(),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate.fixed(
                    [
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.9,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(AppLayout.paddingSize),
                              child: ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text("Teste " + index.toString());
                                },
                                itemCount: 100,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider();
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              );
            },
          ),
        ),
        // Positioned(
        //   top: top,
        //   height: MediaQuery.of(context).size.height * 0.75,
        //   width: headerSize,
        //   child: Stack(
        //     alignment: Alignment.center,
        //     clipBehavior: Clip.none,
        //     children: [
        //       Card(
        //         child: Padding(
        //             padding: EdgeInsets.only(
        //                 top: AppLayout.paddingSize * 3,
        //                 left: AppLayout.paddingSize,
        //                 right: AppLayout.paddingSize,
        //                 bottom: AppLayout.paddingSize),
        //             child: Builder(builder: (BuildContext context) {
        //               return ListView.builder(
        //                 itemCount: 100,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return ListTile(title: Text("Teste"));
        //                 },
        //               );
        //             })),
        //       ),
        //       Positioned(
        //         top: -AppLayout.paddingSize * 2,
        //         child: Padding(
        //           padding: EdgeInsets.all(AppLayout.paddingSize),
        //           child: Card(
        //             color: primaryColor,
        //             child: Padding(
        //               padding: EdgeInsets.all(AppLayout.paddingSize),
        //               child: Column(
        //                 children: [
        //                   Text(
        //                     "Jagni Dasa Horta Bezerra",
        //                     style: theme.textTheme.headline6,
        //                   ),
        //                   Text(
        //                     "• Mobile Developer •",
        //                     style: theme.textTheme.subtitle1
        //                         .apply(color: theme.cardColor),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ]),
    );
  }

  double get top {
    double res = headerSize;
    if (scrollController.hasClients) {
      double offset = scrollController.offset + headerSize / 8;
      if (offset < (res - kToolbarHeight)) {
        res -= offset;
      } else {
        res = kToolbarHeight;
      }
    }
    return res;
  }

  double get headerSize {
    final maxWidth = AppLayout.maxContentWidth(context);
    if (AppLayout.screenIsLarge(context)) {
      return maxWidth * 0.75;
    }
    return maxWidth;
  }
}
