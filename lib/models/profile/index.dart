import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/models/profile/data.dart';

class Profile extends FirebaseEntity {
  ProfileData data;

  Profile.withDoc(DocumentSnapshot doc) : super.withDoc(doc) {
    data = ProfileData.fromJson(doc.data() ?? {});
  }

  @override
  int compareTo(other) {
    if (other is Profile) {
      return uid.compareTo(other.uid);
    }
    return -1;
  }

  static final pluralName = 'profile';
}
