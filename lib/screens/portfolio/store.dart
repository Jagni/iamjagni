import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/portfolio/project/index.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class PortfolioStore = PortfolioStoreBase with _$PortfolioStore;

abstract class PortfolioStoreBase with Store {
  FirebaseEntityDAO<Project> _dao;

  @observable
  ObservableStream<List<Project>> projects;
  @action
  void setupFirebaseListeners() {
    disposeFirebaseListeners();
    _dao = FirebaseEntityDAO<Project>(
        Project.pluralName, (doc) => Project.withDoc(doc));
    projects = ObservableStream(_dao.stream);
  }

  @action
  void disposeFirebaseListeners() {
    if (_dao != null) {
      _dao.dispose();
    }
  }

  @action
  void setStream(Stream<List<Project>> stream) {
    disposeFirebaseListeners();
    projects = ObservableStream(stream);
  }
}
