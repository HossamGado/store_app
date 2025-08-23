import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.textName});
  final VoidCallback? onTap;
  final String textName;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Text(
          textName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
