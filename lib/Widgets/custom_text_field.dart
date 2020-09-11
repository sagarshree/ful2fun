import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBoardType;

  const CustomTextField({
    Key key,
    @required this.controller,
    @required this.hintText,
    this.keyBoardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width * 0.75,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
