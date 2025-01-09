import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final bool hasSuffixIcon;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.hasSuffixIcon = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        suffixIcon: hasSuffixIcon ? Icon(Icons.visibility) : null,
      ),
    );
  }
}
