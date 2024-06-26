import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/main.dart';

class StripePaymentHandleService {
  static Future<void> initPaymentSheet(String clientSecret, bool isDarkMode) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: AppColors.primary,
              background: isDarkMode ? AppColors.secondary : Colors.white,
            ),
            primaryButton: const PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  text: Colors.white,
                  background: AppColors.primary,
                ),
              ),
            ),
          ),
          customFlow: false,
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "FSW Store",
          style: ThemeMode.light,
        ),
      );
    } catch (e) {
      logger.e("[StripePaymentHandle.initPaymentSheet]: $e");
      rethrow;
    }
  }
}
