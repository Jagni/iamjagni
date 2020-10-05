import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iamjagni/home.dart';
import 'package:iamjagni/utils/design.dart';
import 'package:iamjagni/widgets/loading_screen.dart';

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

        Widget shownWidget = LoadingScreen();
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          shownWidget = HomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete

        return MaterialApp(theme: appThemeData, home: shownWidget);
      },
    );
  }
}
