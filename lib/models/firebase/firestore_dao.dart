import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iamjagni/models/firebase/entity.dart';
import 'package:iamjagni/utils/connection_status.dart';

class FirestoreDAO {
  static Future<bool> hasConnection() async {
    await ConnectionStatusSingleton.getInstance().checkConnection();
    return ConnectionStatusSingleton.getInstance().hasConnection;
  }

  ///Adds entity to Firestore and sets it's generated uid.
  ///Returns true if succesful and false if any error ocurred.
  static Future<bool> createEntity(FirebaseEntity entity,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    try {
      final collection =
          FirebaseFirestore.instance.collection(entity.collectionPath());
      if (entity.uid.isEmpty) {
        final reference = await collection.add(entity.toMap());
        entity.uid = reference.id;
      } else {
        await collection.doc(entity.uid).set(entity.toMap());
      }
      return true;
    } catch (exception) {
      return false;
    }
  }

  ///Updates entity on Firestore if it has a valid `documentPath`.
  ///Returns true if succesful and false if any error ocurred.
  static Future<bool> updateEntity(FirebaseEntity entity,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entity.path() != null) {
      try {
        await FirebaseFirestore.instance
            .doc(entity.path())
            .update(entity.toMap());
        return true;
      } catch (exception) {
        return false;
      }
    }

    return false;
  }

  static Future<bool> updateEntityWithMap(String entityPath, dynamic value,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entityPath != null) {
      try {
        await FirebaseFirestore.instance.doc(entityPath).update(value);
        return true;
      } catch (exception) {
        return false;
      }
    }

    return false;
  }

  static Future<bool> setEntityWithMap(String entityPath, dynamic value,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entityPath != null) {
      try {
        await FirebaseFirestore.instance
            .doc(entityPath)
            .set(value)
            .timeout(Duration(seconds: 5));
        return true;
      } catch (exception) {
        return false;
      }
    }

    return false;
  }

  static Future<bool> addToEntityArray(
      String entityPath, String arrayName, dynamic value,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entityPath != null) {
      try {
        final union = FieldValue.arrayUnion([value]);
        final map = Map<String, dynamic>();
        map[arrayName] = union;
        await FirebaseFirestore.instance
            .doc(entityPath)
            .update(map)
            .timeout(Duration(seconds: 5));
        return true;
      } catch (exception) {
        return false;
      }
    }

    return false;
  }

  static Future<bool> removeFromEntityArray(
      String entityPath, String arrayName, dynamic value,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entityPath != null) {
      try {
        final remove = FieldValue.arrayRemove([value]);
        final map = Map<String, dynamic>();
        map[arrayName] = remove;
        await FirebaseFirestore.instance
            .doc(entityPath)
            .update(map)
            .timeout(Duration(seconds: 5));
        return true;
      } catch (exception) {
        return false;
      }
    }

    return false;
  }

  ///Deletes entity on Firestore if it has a valid `documentPath`.
  ///Returns true if succesful and false if any error ocurred.
  static Future<bool> deleteEntity(FirebaseEntity entity,
      {bool saveOffline = true}) async {
    if (!saveOffline) {
      if (!await hasConnection()) {
        return false;
      }
    }
    if (entity.path() != null) {
      try {
        await FirebaseFirestore.instance
            .doc(entity.path())
            .delete()
            .timeout(Duration(seconds: 5));
        return true;
      } catch (_) {
        return false;
      }
    }
    return false;
  }

  ///Gets a single document. Will return null if the path is invalid.
  static Future<DocumentSnapshot> getDocumentByPath(String path) async {
    return await FirebaseFirestore.instance.doc(path).get();
  }

  ///Gets a single document. Will return null if the path is invalid.
  static Stream<DocumentSnapshot> trackDocumentByPath(String path) {
    return FirebaseFirestore.instance.doc(path).snapshots();
  }

  ///Gets all documents from a collection. Will return null if the path is invalid.
  static Stream<List<DocumentSnapshot>> trackAllDocuments(
      {String collectionPath}) {
    return FirebaseFirestore.instance
        .collection(collectionPath)
        .snapshots()
        .map((snap) => snap.docs);
  }

  static Future<List<DocumentSnapshot>> getAllDocuments(
      {String collectionPath}) async {
    final query =
        await FirebaseFirestore.instance.collection(collectionPath).get();
    return query.docs;
  }

  static Stream<List<DocumentSnapshot>> queryDocuments(String collectionPath,
      {Query buildQuery(CollectionReference collection)}) {
    final collection = FirebaseFirestore.instance.collection(collectionPath);
    if (buildQuery != null) {
      final query = buildQuery(collection);
      return query.snapshots().map((snap) => snap.docs);
    }
    return collection.snapshots().map((snap) => snap.docs);
  }

  static Future<List<DocumentSnapshot>> getDocumentsWithQuery(
      {String collectionPath,
      Query buildQuery(CollectionReference collection)}) async {
    final collection = FirebaseFirestore.instance.collection(collectionPath);
    final query = buildQuery(collection);
    final snapshot = await query.get();
    return snapshot.docs;
  }
}
