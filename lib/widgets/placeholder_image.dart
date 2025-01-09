import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Image.asset(
        'assets/images/logo.png', // Path ke logo Anda
        fit: BoxFit.contain,      // Penyesuaian ukuran
      ),
    );
  }
}
