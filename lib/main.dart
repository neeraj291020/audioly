import 'package:audioly/signup.dart';
import 'package:flutter/material.dart';
import 'songs.dart';
import 'welcome.dart';
import 'signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/signup': (context) => const Signup(),
        '/songs': (context) => const Songs(),
      },
      home: Welcome(),
    );
  }
}
