import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/profile_data.dart';

class Profile extends FirebaseEntity {
  ProfileData personalData;

  Profile.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    personalData = ProfileData.fromJson(doc.data());
  }

  @override
  int compareTo(other) {
    return this.uid = other.uid;
  }

  static final pluralName = "profiles";
}
