import 'package:flutter/material.dart';

import 'LoginSignUp/login_page.dart';

void main() => runApp(MyApp());

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
        body: LogInPage(),
      ),
    );
  }
}
