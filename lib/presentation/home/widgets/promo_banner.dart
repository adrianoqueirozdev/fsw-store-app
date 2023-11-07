import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoBanner extends StatelessWidget {
  final String assetName;

  const PromoBanner({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SvgPicture.asset(
        assetName,
        width: size.width,
      ),
    );
  }
}
