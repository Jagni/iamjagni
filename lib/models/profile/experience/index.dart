import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/experience/data.dart';

class Experience extends FirebaseEntity {
  ExperienceData data;

  Experience.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = ExperienceData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    if (other is Experience) {
      final priorityComparison =
          this.data.priority.compareTo(other.data.priority);
      if (priorityComparison == 0) {
        return this
            .data
            .title
            .toLowerCase()
            .compareTo(other.data.title.toLowerCase());
      }
    }
    return -1;
  }

  static final pluralName = "profiles";
}
