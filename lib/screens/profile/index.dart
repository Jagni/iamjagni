import 'package:flutter/material.dart';
import 'package:iamjagni/models/profile/index.dart';
import 'package:iamjagni/screens/profile/widgets/content.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/cached_image_wrapper.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<Profile>(
        list: false,
        builder: (profile, context) {
          return buildScreen(profile, context);
        },
        selectedStream: (store) {
          return store.profile.profile;
        });
  }

  Widget buildScreen(Profile profile, BuildContext context) {
    final theme = Theme.of(context);

    return Provider.value(
      value: profile,
      child: Scaffold(
          body: SlidingSheet(
        maxWidth: sheetWith(context),
        parallaxSpec: ParallaxSpec(enabled: true),
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.only(top: AppLayout.paddingSize),
        cornerRadius: 16,
        closeOnBackdropTap: true,
        closeOnBackButtonPressed: true,
        backdropColor: AppLayout.screenIsLarge(context)
            ? Colors.transparent
            : theme.scaffoldBackgroundColor,
        padding: EdgeInsets.only(bottom: AppLayout.paddingSize),
        snapSpec: const SnapSpec(
          // Set custom snapping points.
          snappings: [0.4, 1],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Align(
          child: SizedBox(
              height: imageHeight(context),
              child: CachedImageWrapper(
                  url: profile.data.photo,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter)),
          alignment: Alignment.topCenter,
        ),
        headerBuilder: (context, state) {
          return SizedBox(
            height: 100,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: theme.bottomSheetTheme.backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(AppLayout.paddingSize),
                                topLeft:
                                    Radius.circular(AppLayout.paddingSize))),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: sheetWith(context) - AppLayout.paddingSize * 4,
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.all(0),
                      color: theme.primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(AppLayout.paddingSize),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                profile.data.name,
                                style: theme.textTheme.headline4
                                    .apply(color: Colors.white),
                              ),
                            ),
                            Text(
                              '• Mobile Developer •',
                              style: theme.textTheme.headline6
                                  .apply(color: theme.cardColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
              child: Card(
                  color: theme.bottomSheetTheme.backgroundColor,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(AppLayout.paddingSize),
                          bottomLeft: Radius.circular(AppLayout.paddingSize))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.paddingSize,
                          horizontal: AppLayout.paddingSize * 2 + 4),
                      child: ProfileContent())));
        },
      )),
    );
  }

  double imageHeight(BuildContext context) {
    return AppLayout.maxContentHeight(context);
  }

  double sheetWith(BuildContext context) {
    final maxWidth = AppLayout.maxContentWidth(context);
    if (AppLayout.screenIsLarge(context)) {
      return maxWidth * 0.75;
    }
    return maxWidth;
  }
}
