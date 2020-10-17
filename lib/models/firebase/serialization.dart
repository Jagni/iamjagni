import 'package:cloud_firestore/cloud_firestore.dart';

class SerializationHelper {
  static String formatFirebaseText(String text) {
    if (text != null) {
      return text.replaceAll("\\n", "\n");
    }
    return text;
  }

  static DateTime dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime dateTimeFromTimestamp(Timestamp timestamp) {
    if (timestamp != null) {
      return timestamp.toDate();
    }
    return null;
  }
}
