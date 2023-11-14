import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String assetName;
  final VoidCallback onTap;

  const PromoBanner({super.key, required this.assetName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Image.asset(
          assetName,
          width: size.width,
        ),
      ),
    );
  }
}
