import 'package:iamjagni/models/firebase/entity_dao.dart';
import 'package:iamjagni/models/portfolio/project.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class PortfolioStore = PortfolioStoreBase with _$PortfolioStore;

abstract class PortfolioStoreBase with Store {
  FirebaseEntityDAO<Project> _dao;

  @observable
  ObservableStream<List<Project>> projects;
  @action
  setupFirebaseListeners() {
    disposeFirebaseListeners();
    _dao = FirebaseEntityDAO<Project>(
        Project.pluralName, (doc) => Project.withDoc(doc));
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

  @observable
  Project selectedProject;
  @action
  setSelectedProject(Project project) {
    selectedProject = project;
  }
}
