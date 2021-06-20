import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:planted/constants.dart';
import 'package:planted/pages/login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  await dotenv.load(fileName: "secrets/.env");

  runApp(ProviderScope(child: MyApp()));
}

class FlutterFireInitializer extends StatefulWidget {
  @override
  _FlutterFireInitializerState createState() => _FlutterFireInitializerState();
}

class _FlutterFireInitializerState extends State<FlutterFireInitializer> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.projectName,
      theme: ThemeData(
        primaryColor: CustomColorScheme.primaryColor,
      ),
      home: LoginPageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
