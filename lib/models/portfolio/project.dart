import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';

class Project extends FirebaseEntity {
  String title;
  String iconUrl;
  List<String> screenshots;
  String description;
  List<ProjectURL> urls;
  List<String> technologies;
  DateTime date;

  Project.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    final map = doc.data();
    title = map['title'];
    iconUrl = map['iconUrl'];
    description = map['description'];
    if (description != null) description = description.replaceAll("\\n", "\n");
    final timestamp = map['date'] as Timestamp;
    if (timestamp != null) {
      date = timestamp.toDate();
    }

    List<dynamic> dynamicList = map['screenshots'] ?? [];
    screenshots = [];
    dynamicList.forEach((data) {
      screenshots.add(data);
    });

    dynamicList = map['technologies'] ?? [];
    technologies = [];
    dynamicList.forEach((data) {
      technologies.add(data);
    });
    technologies.sort();

    dynamicList = map['urls'] ?? [];
    urls = [];
    dynamicList.forEach((data) {
      urls.add(ProjectURL(data));
    });
    urls.sort();
  }

  @override
  int compareTo(other) {
    if (other is Project) {
      return this.title.toLowerCase().compareTo(other.title.toLowerCase());
    }
    return -1;
  }

  static String pluralName = "projects";

  @override
  LinkedHashMap<String, dynamic> toMap() {
    final map = super.toMap();
    map["title"] = this.title;
    map["iconUrl"] = this.iconUrl;
    map["date"] = Timestamp.fromDate(date);
    return map;
  }
}

class ProjectURL with Comparable {
  String label;
  String url;
  ProjectURL(Map<String, dynamic> map) {
    label = map["label"];
    url = map["url"];
  }

  @override
  int compareTo(other) {
    if (other is ProjectURL) return this.label.compareTo(other.label);
    return 0;
  }
}
