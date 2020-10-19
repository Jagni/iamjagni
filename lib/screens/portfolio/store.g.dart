// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PortfolioStore on PortfolioStoreBase, Store {
  final _$projectsAtom = Atom(name: 'PortfolioStoreBase.projects');

  @override
  ObservableStream<List<Project>> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(ObservableStream<List<Project>> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  final _$PortfolioStoreBaseActionController =
      ActionController(name: 'PortfolioStoreBase');

  @override
  void setupFirebaseListeners() {
    final _$actionInfo = _$PortfolioStoreBaseActionController.startAction(
        name: 'PortfolioStoreBase.setupFirebaseListeners');
    try {
      return super.setupFirebaseListeners();
    } finally {
      _$PortfolioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeFirebaseListeners() {
    final _$actionInfo = _$PortfolioStoreBaseActionController.startAction(
        name: 'PortfolioStoreBase.disposeFirebaseListeners');
    try {
      return super.disposeFirebaseListeners();
    } finally {
      _$PortfolioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStream(Stream<List<Project>> stream) {
    final _$actionInfo = _$PortfolioStoreBaseActionController.startAction(
        name: 'PortfolioStoreBase.setStream');
    try {
      return super.setStream(stream);
    } finally {
      _$PortfolioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projects: ${projects}
    ''';
  }
}
