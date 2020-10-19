import 'package:iamjagni/screens/formation/store.dart';
import 'package:iamjagni/screens/portfolio/store.dart';
import 'package:iamjagni/screens/profile/store.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MainStore extends MainStoreBase with _$MainStore {
  setupFirebaseListeners() {
    this.portfolio.setupFirebaseListeners();
    this.profile.setupFirebaseListeners();
    this.formation.setupFirebaseListeners();
  }
}

abstract class MainStoreBase with Store {
  final portfolio = PortfolioStore();
  final profile = ProfileStore();
  final formation = FormationStore();
}
