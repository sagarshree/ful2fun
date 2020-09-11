import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  // final bool loadingHandler;
  final Function onPressed;

  const SubmitButton({
    this.text,
    // this.loadingHandler,
    this.onPressed,
  });

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: size.width * 0.75,
        decoration: BoxDecoration(
          gradient: UniversalConstants.fabGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
