import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/app_logo.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondary,
      child: Center(
        child: AppLogo(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
