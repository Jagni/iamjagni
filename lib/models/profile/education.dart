import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/education_data.dart';

class EducationEntry extends FirebaseEntity {
  EducationData data;

  EducationEntry.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = EducationData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    final priorityComparison = this.data.priority.compareTo(other.priority);
    if (priorityComparison == 0) {
      final dateDifference =
          this.data.startDate.difference(other.startDate).inDays;
      var dateComparison = 0;
      if (dateDifference.abs() > 30) {
        if (dateDifference.isNegative) {
          dateComparison = 1;
        } else {
          dateComparison = -1;
        }
        return this.data.title.compareTo(other.title);
      }
      return dateComparison;
    }
    return priorityComparison;
  }
}
