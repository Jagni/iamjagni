import 'dart:collection';

import "package:cloud_firestore/cloud_firestore.dart";

abstract class FirebaseEntity extends Comparable {
  ///Firestore's document ID
  String uid = "";

  ///Path to parent node, which contains this entity's collection.
  ///If null or empty, the collection will be created on the root firestore node: `/`
  String parentPath = "";

  ///This entity's collection name
  static String pluralName;

  ///Subclasses should only provide default constructors if the entity can be created.
  ///Readonly entities must only have the [.withDoc] constructor.
  FirebaseEntity({String uid, String parentPath}) {
    if (uid != null) {
      this.uid = uid;
    }
    if (parentPath != null) {
      this.parentPath = parentPath;
    }
  }

  ///Subclasses must override this constructor and
  ///obtain properties from the DocumentSnapshot like so:
  ///```
  ///property1 = doc.data["property1"];
  ///property2 = doc.data["property2"];
  ///...
  ///```
  FirebaseEntity.withDoc(DocumentSnapshot doc) {
    uid = doc.id;
    final pathComponents = doc.reference.path.split("/");
    pathComponents.removeLast();
    pathComponents.removeLast();
    parentPath = '';

    pathComponents.forEach((string) {
      parentPath += string + '/';
    });
  }

  String collectionPath() {
    return parentPath + pluralName;
  }

  String path() {
    if (uid.isNotEmpty) {
      return collectionPath() + "/" + uid;
    }
    return null;
  }

  ///Returns a map containing all properties of this entity that must be saved on Firestore.
  ///Subclasses must add new entries to the map like so:
  ///```
  ///final map = super.toMap();
  ///map["property1"] = property1;
  ///map["property2"] = property2;
  ///...
  ///return map;
  ///```
  LinkedHashMap<String, dynamic> toMap() {
    return LinkedHashMap<String, dynamic>();
  }
}
