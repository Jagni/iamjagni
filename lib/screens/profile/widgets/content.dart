import 'package:flutter/material.dart';
import 'package:iamjagni/models/profile/index.dart';
import 'package:iamjagni/screens/profile/widgets/contact/list.dart';
import 'package:iamjagni/screens/profile/widgets/experience/list.dart';
import 'package:iamjagni/screens/profile/widgets/skills/list.dart';
import 'package:iamjagni/utils/layout.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<Profile>(builder: (context, profile, widget) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            profile.data.description,
          ),
          SizedBox(height: AppLayout.paddingSize),
          Text(
            "Contato",
            style: theme.textTheme.headline5,
          ),
          SizedBox(height: 4),
          SizedBox(height: 100, child: ProfileContactList()),
          SizedBox(height: AppLayout.paddingSize),
          Text(
            "Habilidades",
            style: theme.textTheme.headline5,
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: SkillsList()),
              ],
            ),
          ),
          SizedBox(height: AppLayout.paddingSize),
          Text(
            "Experiência",
            style: theme.textTheme.headline5,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: ExperiencesList()),
            ],
          )
        ],
      );
    });
  }
}
