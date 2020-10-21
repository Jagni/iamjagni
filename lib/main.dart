import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/home.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/widgets/status_screens/error.dart';
import 'package:iamjagni/widgets/status_screens/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final Future<FirebaseApp> _appInitialization = Firebase.initializeApp();
  Future<UserCredential> _authInitialization;
  @override
  Widget build(BuildContext context) {
    return appInitializationScreen();
  }

  Widget appInitializationScreen() {
    return FutureBuilder(
      future: _appInitialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return buildErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          _authInitialization ??= FirebaseAuth.instance.signInAnonymously();
          return signInInitializationScreen();
        }

        return buildLoadingScreen();
      },
    );
  }

  Widget signInInitializationScreen() {
    return FutureBuilder(
      future: _authInitialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return buildErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return buildHome();
        }

        return buildLoadingScreen();
      },
    );
  }

  Widget buildHome() {
    final analytics = FirebaseAnalytics();
    final observer = FirebaseAnalyticsObserver(analytics: analytics);
    final store = MainStore();
    store.setupFirebaseListeners();
    return MultiProvider(
        providers: [
          Provider.value(value: store),
          Provider.value(value: analytics)
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: brightAppThemeData,
            darkTheme: darkAppThemeData,
            navigatorObservers: [observer],
            home: HomePage(observer)));
  }

  Widget buildLoadingScreen() {
    return MaterialApp(
        theme: brightAppThemeData,
        darkTheme: darkAppThemeData,
        home: Scaffold(body: LoadingScreen()));
  }

  Widget buildErrorScreen() {
    return MaterialApp(
        theme: brightAppThemeData,
        darkTheme: darkAppThemeData,
        home: Scaffold(
            body: ErrorScreen(
                message: 'Ops! Verifique sua conexão com a internet...')));
  }
}
