import 'package:flutter/material.dart';
import 'package:iamjagni/models/profile/experience/index.dart';
import 'package:iamjagni/screens/profile/widgets/experience/tile.dart';
import 'package:iamjagni/widgets/store_stream_builder.dart';

class ExperiencesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreStreamBuilder<List<Experience>>(
        builder: (experiences, context) {
      return buildList(experiences, context);
    }, selectedStream: (store) {
      return store.profile.experiences;
    });
  }

  Widget buildList(List<Experience> experiences, BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: experiences.length,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          return ExperienceTile(experience: experiences[index]);
        });
  }
}
