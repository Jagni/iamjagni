import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/profile/experience/index.dart';
import 'package:iamjagni/models/profile/index.dart';
import 'package:iamjagni/models/profile/skill/index.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  SingleFirebaseEntityDAO<Profile> _profileDAO;
  FirebaseEntityDAO<Skill> _skillsDAO;
  FirebaseEntityDAO<Experience> _experiencesDAO;

  @observable
  ObservableStream<Profile> profile;
  @observable
  ObservableStream<List<Skill>> skills;
  @observable
  ObservableStream<List<Experience>> experiences;

  @action
  void setupFirebaseListeners() {
    disposeFirebaseListeners();

    _profileDAO = SingleFirebaseEntityDAO<Profile>(
        Profile.pluralName + '/default', (doc) => Profile.withDoc(doc));
    profile = ObservableStream(_profileDAO.stream);

    _skillsDAO = FirebaseEntityDAO<Skill>(
        Profile.pluralName + '/default/' + Skill.pluralName,
        (doc) => Skill.withDoc(doc));
    skills = ObservableStream(_skillsDAO.stream);

    _experiencesDAO = FirebaseEntityDAO<Experience>(
        Profile.pluralName + '/default/' + Experience.pluralName,
        (doc) => Experience.withDoc(doc));
    experiences = ObservableStream(_experiencesDAO.stream);
  }

  @action
  void disposeFirebaseListeners() {
    if (_profileDAO != null) {
      _profileDAO.dispose();
    }
    if (_skillsDAO != null) {
      _skillsDAO.dispose();
    }
    if (_experiencesDAO != null) {
      _experiencesDAO.dispose();
    }
  }

  @action
  void setProfileStream(Stream<Profile> stream) {
    disposeFirebaseListeners();
    profile = ObservableStream(stream);
  }

  @action
  void setExperienceStream(Stream<List<Experience>> stream) {
    disposeFirebaseListeners();
    experiences = ObservableStream(stream);
  }

  @action
  void setSkillsStream(Stream<List<Skill>> stream) {
    disposeFirebaseListeners();
    skills = ObservableStream(stream);
  }
}
