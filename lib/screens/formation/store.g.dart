// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormationStore on FormationStoreBase, Store {
  final _$entriesAtom = Atom(name: 'FormationStoreBase.entries');

  @override
  ObservableStream<List<FormationEntry>> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(ObservableStream<List<FormationEntry>> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  final _$FormationStoreBaseActionController =
      ActionController(name: 'FormationStoreBase');

  @override
  void setupFirebaseListeners() {
    final _$actionInfo = _$FormationStoreBaseActionController.startAction(
        name: 'FormationStoreBase.setupFirebaseListeners');
    try {
      return super.setupFirebaseListeners();
    } finally {
      _$FormationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeFirebaseListeners() {
    final _$actionInfo = _$FormationStoreBaseActionController.startAction(
        name: 'FormationStoreBase.disposeFirebaseListeners');
    try {
      return super.disposeFirebaseListeners();
    } finally {
      _$FormationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormationStream(Stream<List<FormationEntry>> stream) {
    final _$actionInfo = _$FormationStoreBaseActionController.startAction(
        name: 'FormationStoreBase.setFormationStream');
    try {
      return super.setFormationStream(stream);
    } finally {
      _$FormationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entries: ${entries}
    ''';
  }
}
