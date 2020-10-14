import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/profile/index.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  SingleFirebaseEntityDAO<Profile> _dao;

  @observable
  ObservableStream<Profile> projects;
  @action
  setupFirebaseListeners() {
    disposeFirebaseListeners();

    _dao = SingleFirebaseEntityDAO<Profile>(
        Profile.pluralName + "/default", (doc) => Profile.withDoc(doc));
    projects = ObservableStream(_dao.stream);
  }

  @action
  disposeFirebaseListeners() {
    if (_dao != null) {
      _dao.dispose();
    }
  }

  @action
  setStream(Stream stream) {
    disposeFirebaseListeners();
    projects = ObservableStream(stream);
  }
}
