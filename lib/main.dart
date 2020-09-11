import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ful2fun/Home/home_page.dart';
import 'package:ful2fun/Profile/edit_profile.dart';

import 'SignInSignUp/signin_signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
