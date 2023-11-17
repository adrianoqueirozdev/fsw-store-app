import 'package:flutter/material.dart';
import 'package:fsw_store/presentation/splash/splash_controller.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/app_logo.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: AppLogo(
              width: size.width * 0.5,
            ).animate().shakeX(delay: 200.ms).elevation(
                  end: 20,
                  color: AppColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
          ),
        );
      },
    );
  }
}
