import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/profile_data.dart';

class Profile extends FirebaseEntity {
  ProfileData data;

  Profile.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = ProfileData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    return this.uid = other.uid;
  }

  static final pluralName = "profiles";
}
