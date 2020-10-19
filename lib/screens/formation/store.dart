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
  void setupFirebaseListeners() {
    disposeFirebaseListeners();

    _formationDAO = FirebaseEntityDAO<FormationEntry>(
        FormationEntry.pluralName, (doc) => FormationEntry.withDoc(doc));
    entries = ObservableStream(_formationDAO.stream);
  }

  @action
  void disposeFirebaseListeners() {
    if (_formationDAO != null) {
      _formationDAO.dispose();
    }
  }

  @action
  void setFormationStream(Stream<List<FormationEntry>> stream) {
    disposeFirebaseListeners();
    entries = ObservableStream(stream);
  }
}
