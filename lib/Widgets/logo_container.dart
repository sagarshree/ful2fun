import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';

class LogoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          gradient: UniversalConstants.fabGradient,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 3,
            color: Colors.white,
          )),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.cover,
            )),
        // child: Image.asset('images/logo.png'),
      ),
    );
  }
}
