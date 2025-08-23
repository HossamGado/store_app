import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.inputType,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
  });

  String hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
