import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final bool hasSuffixIcon;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.hasSuffixIcon = false, required Function(dynamic value) onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        suffixIcon: hasSuffixIcon ? Icon(Icons.visibility) : null,
      ),
    );
  }
}
