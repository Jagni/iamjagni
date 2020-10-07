import 'package:iamjagni/screens/portfolio/store.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase with Store {
  final portfolio = PortfolioStore();
}
