import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/portfolio/project/data.dart';

class Project extends FirebaseEntity {
  ProjectData data;

  Project.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = ProjectData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    if (other is Project) {
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

  static String pluralName = 'projects';

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map.addAll(data.toJson());
    return map;
  }
}
