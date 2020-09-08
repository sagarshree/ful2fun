import 'package:flutter/material.dart';

class UniversalVariables {
  static final Gradient fabGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff57DEC0),
      Color(0xff2d7adc),
    ],
  );
  static final Color mainCol = Colors.blue;
  //For Scaffold Background
  static final Color backgroundCol = Color(0xfffaf9fc);
  //app bar theme
  static final IconThemeData iconTheme = IconThemeData(
    color: mainCol,
  );
}
