import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String assetName;

  const PromoBanner({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Image.asset(
        assetName,
        width: size.width,
      ),
    );
  }
}
