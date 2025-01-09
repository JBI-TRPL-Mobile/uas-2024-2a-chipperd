import 'package:flutter/material.dart';

class SocialSignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.g_mobiledata, size: 40),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.facebook, size: 40),
        ),
      ],
    );
  }
}