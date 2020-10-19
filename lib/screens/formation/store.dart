import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/formation/index.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class FormationStore = FormationStoreBase with _$FormationStore;

abstract class FormationStoreBase with Store {
  FirebaseEntityDAO<FormationEntry> _formationDAO;

  @observable
  ObservableStream<List<FormationEntry>> entries;

  @action
  setupFirebaseListeners() {
    disposeFirebaseListeners();

    _formationDAO = FirebaseEntityDAO<FormationEntry>(
        FormationEntry.pluralName, (doc) => FormationEntry.withDoc(doc));
    entries = ObservableStream(_formationDAO.stream);
  }

  @action
  disposeFirebaseListeners() {
    if (_formationDAO != null) {
      _formationDAO.dispose();
    }
  }

  @action
  setFormationStream(Stream stream) {
    disposeFirebaseListeners();
    entries = ObservableStream(stream);
  }
}
