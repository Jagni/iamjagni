import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/formation/data.dart';
import 'package:iamjagni/models/firebase/entity.dart';

class FormationEntry extends FirebaseEntity {
  FormationData data;

  FormationEntry.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = FormationData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    final dateDifference =
        this.data.finishDate.difference(other.data.finishDate).inDays;
    var dateComparison = 0;
    if (dateDifference.abs() > 30) {
      if (dateDifference.isNegative) {
        dateComparison = 1;
      } else {
        dateComparison = -1;
      }
      return this.data.title.compareTo(other.data.title);
    }
    return dateComparison;
  }

  static const pluralName = "formation";
}
