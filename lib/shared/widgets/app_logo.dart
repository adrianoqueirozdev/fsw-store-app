import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/shared/constants/app_images.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  final double width;

  const AppLogo({super.key, this.width = 120.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAllNamed(Routes.home),
      child: SvgPicture.asset(
        AppImages.logo,
        width: width,
      ),
    );
  }
}
