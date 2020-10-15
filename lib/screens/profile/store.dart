import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/profile/education.dart';
import 'package:iamjagni/models/profile/index.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  SingleFirebaseEntityDAO<Profile> _profileDAO;
  FirebaseEntityDAO<EducationEntry> _educationDAO;

  @observable
  ObservableStream<Profile> profile;
  @observable
  ObservableStream<List<EducationEntry>> educationEntries;

  @action
  setupFirebaseListeners() {
    disposeFirebaseListeners();

    _profileDAO = SingleFirebaseEntityDAO<Profile>(
        Profile.pluralName + "/default", (doc) => Profile.withDoc(doc));
    profile = ObservableStream(_profileDAO.stream);

    _educationDAO = FirebaseEntityDAO<EducationEntry>(
        Profile.pluralName + "/default" + EducationEntry.pluralName,
        (doc) => EducationEntry.withDoc(doc));
    educationEntries = ObservableStream(_educationDAO.stream);
  }

  @action
  disposeFirebaseListeners() {
    if (_profileDAO != null) {
      _profileDAO.dispose();
    }
    if (_educationDAO != null) {
      _educationDAO.dispose();
    }
  }

  @action
  setProfileStream(Stream stream) {
    disposeFirebaseListeners();
    profile = ObservableStream(stream);
  }

  @action
  setEducationStream(Stream stream) {
    disposeFirebaseListeners();
    educationEntries = ObservableStream(stream);
  }
}
