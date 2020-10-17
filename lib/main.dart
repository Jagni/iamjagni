import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/home.dart';
import 'package:iamjagni/store.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/widgets/status_screens/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Show something whilst waiting for initialization to complete
        Widget shownWidget = Scaffold(body: LoadingScreen());
        MainStore store;
        // Otherwise show application
        if (snapshot.connectionState == ConnectionState.done) {
          shownWidget = HomePage();
          store = MainStore();
          store.setupFirebaseListeners();
        }

        return Provider.value(
            value: store,
            child: MaterialApp(
                theme: brightAppThemeData,
                darkTheme: darkAppThemeData,
                home: shownWidget));
      },
    );
  }
}
