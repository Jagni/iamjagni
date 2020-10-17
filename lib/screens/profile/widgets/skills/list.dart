import 'package:flutter/material.dart';
import 'package:iamjagni/models/profile/skill/index.dart';
import 'package:iamjagni/screens/profile/widgets/skills/tile.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';

class SkillsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<List<Skill>>(builder: (projects, context) {
      return buildList(projects, context);
    }, selectedStream: (store) {
      return store.profile.skills;
    });
  }

  Widget buildList(List<Skill> skills, BuildContext context) {
    return SingleChildScrollView(
        primary: false,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: skills.map((skill) => SkillTile(skill: skill)).toList()));
  }
}
