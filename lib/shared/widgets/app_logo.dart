import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/shared/constants/app_images.dart';

class AppLogo extends StatelessWidget {
  final double width;

  const AppLogo({super.key, this.width = 120.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.logo,
      width: width,
    );
  }
}
