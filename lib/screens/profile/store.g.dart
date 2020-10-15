// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on ProfileStoreBase, Store {
  final _$profileAtom = Atom(name: 'ProfileStoreBase.profile');

  @override
  ObservableStream<Profile> get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(ObservableStream<Profile> value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$educationEntriesAtom =
      Atom(name: 'ProfileStoreBase.educationEntries');

  @override
  ObservableStream<List<EducationEntry>> get educationEntries {
    _$educationEntriesAtom.reportRead();
    return super.educationEntries;
  }

  @override
  set educationEntries(ObservableStream<List<EducationEntry>> value) {
    _$educationEntriesAtom.reportWrite(value, super.educationEntries, () {
      super.educationEntries = value;
    });
  }

  final _$ProfileStoreBaseActionController =
      ActionController(name: 'ProfileStoreBase');

  @override
  dynamic setupFirebaseListeners() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setupFirebaseListeners');
    try {
      return super.setupFirebaseListeners();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic disposeFirebaseListeners() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.disposeFirebaseListeners');
    try {
      return super.disposeFirebaseListeners();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProfileStream(Stream<dynamic> stream) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setProfileStream');
    try {
      return super.setProfileStream(stream);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEducationStream(Stream<dynamic> stream) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setEducationStream');
    try {
      return super.setEducationStream(stream);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
educationEntries: ${educationEntries}
    ''';
  }
}
