class AppKeys {
  static final profileTab = 'profileTab';
  static final portfolioTab = 'portfolioTab';
  static final formationTab = 'formationTab';
  static final projectCirclePrefix = 'projectCircle';

  static String projectCircle(int index) {
    return projectCirclePrefix + index.toString();
  }
}
