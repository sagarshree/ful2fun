import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final Function onTap;
  final Function validator;
  final bool obscure;
  final bool showSuffixIcon;
  final Function suffixIconOnpressed;
  final Function onEditingComplete;

  const CustomTextFormField({
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.focusNode,
    this.prefixIconData,
    this.suffixIconData,
    this.onTap,
    this.validator,
    this.obscure,
    this.showSuffixIcon,
    this.suffixIconOnpressed,
    this.onEditingComplete,
  });
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(top: 10.0, bottom: 5.0)
          : EdgeInsets.only(top: 5.0, bottom: 5.0),
      width: orientation == Orientation.portrait
          ? size.width * 0.72
          : size.width * 0.4,
      child: TextFormField(
        onTap: onTap,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        textInputAction: textInputAction,
        focusNode: focusNode,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.6),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.cyan,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            prefixIconData,
            size: 22,
          ),
          suffixIcon: showSuffixIcon
              ? IconButton(
                  icon: Icon(
                    suffixIconData,
                    size: 22,
                  ),
                  onPressed: suffixIconOnpressed,
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
