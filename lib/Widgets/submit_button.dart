import 'package:flutter/material.dart';
import 'package:ful2fun/Widgets/universal_variables.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final bool loadingHandler;
  final Function onPressed;

  const SubmitButton({
    this.text,
    this.loadingHandler,
    this.onPressed,
  });

  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: UniversalVariables.fabGradient,
      ),
      height: orientation == Orientation.portrait
          ? size.height * 0.068
          : size.height * 0.125,
      width: orientation == Orientation.portrait
          ? size.width * 0.4
          : size.width * 0.25,
      child: Center(
        child: FlatButton(
          onPressed: onPressed,
          child: !loadingHandler
              ? Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                )
              : Center(
                  // child: SpinKitThreeBounce(
                  //   color: Colors.white,
                  //   size: 30,
                  // ),
                  ),
        ),
      ),
    );
  }
}
