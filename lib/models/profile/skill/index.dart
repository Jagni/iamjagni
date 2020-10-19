import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/skill/data.dart';

class Skill extends FirebaseEntity {
  SkillData data;

  Skill.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = SkillData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    if (other is Skill) {
      final priorityComparison = data.priority.compareTo(other.data.priority);
      if (priorityComparison == 0) {
        return data.title
            .toLowerCase()
            .compareTo(other.data.title.toLowerCase());
      }
      return -priorityComparison;
    }
    return -1;
  }

  static final pluralName = 'skills';
}
