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

  final _$skillsAtom = Atom(name: 'ProfileStoreBase.skills');

  @override
  ObservableStream<List<Skill>> get skills {
    _$skillsAtom.reportRead();
    return super.skills;
  }

  @override
  set skills(ObservableStream<List<Skill>> value) {
    _$skillsAtom.reportWrite(value, super.skills, () {
      super.skills = value;
    });
  }

  final _$experiencesAtom = Atom(name: 'ProfileStoreBase.experiences');

  @override
  ObservableStream<List<Experience>> get experiences {
    _$experiencesAtom.reportRead();
    return super.experiences;
  }

  @override
  set experiences(ObservableStream<List<Experience>> value) {
    _$experiencesAtom.reportWrite(value, super.experiences, () {
      super.experiences = value;
    });
  }

  final _$ProfileStoreBaseActionController =
      ActionController(name: 'ProfileStoreBase');

  @override
  void setupFirebaseListeners() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setupFirebaseListeners');
    try {
      return super.setupFirebaseListeners();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeFirebaseListeners() {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.disposeFirebaseListeners');
    try {
      return super.disposeFirebaseListeners();
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileStream(Stream<Profile> stream) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setProfileStream');
    try {
      return super.setProfileStream(stream);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExperienceStream(Stream<List<Experience>> stream) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setExperienceStream');
    try {
      return super.setExperienceStream(stream);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSkillsStream(Stream<List<Skill>> stream) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setSkillsStream');
    try {
      return super.setSkillsStream(stream);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
skills: ${skills},
experiences: ${experiences}
    ''';
  }
}
