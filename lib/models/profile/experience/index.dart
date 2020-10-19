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
      return -data.startDate.compareTo(other.data.startDate);
    }
    return -1;
  }

  static final pluralName = 'experiences';
}
