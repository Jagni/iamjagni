import 'package:flutter/material.dart';
import 'package:iamjagni/models/profile/skill/index.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:iamjagni/widgets/image/cached_image_wrapper.dart';

class SkillTile extends StatelessWidget {
  final Skill skill;

  const SkillTile({Key key, this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
            padding: EdgeInsets.only(right: AppLayout.paddingSize),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: constraints.maxHeight * 0.5,
                    child: CachedImageWrapper(
                      url: skill.data.icon,
                      fit: BoxFit.contain,
                    )),
                SizedBox(height: 8),
                Flexible(
                    child: Text(
                  skill.data.title,
                  textAlign: TextAlign.center,
                )),
              ],
            ));
      },
    );
  }
}
