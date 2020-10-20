import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;
  final String url;

  const ContactTile(
      {Key key,
      this.icon = Icons.contact_mail,
      this.name = '',
      this.color = Colors.transparent,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: constraints.maxHeight * 0.7,
              width: constraints.maxHeight * 0.7,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: color,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppLayout.paddingSize)),
                  child: InkWell(
                    onTap: () {
                      final analytics = Provider.of<FirebaseAnalytics>(context,
                          listen: false);
                      analytics.logEvent(
                          name: 'opened_url', parameters: {'value': url});
                      launch(url);
                    },
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: constraints.maxHeight * 0.35,
                    ),
                  )),
            ),
            Flexible(child: Text(name)),
          ],
        );
      },
    );
  }
}
