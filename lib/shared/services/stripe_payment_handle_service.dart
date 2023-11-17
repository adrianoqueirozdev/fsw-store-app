import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/main.dart';

class StripePaymentHandleService {
  static Future<void> initPaymentSheet(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: AppColors.primary,
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  text: Colors.white,
                  background: AppColors.primary,
                ),
              ),
            ),
          ),
          customFlow: false,
          style: ThemeMode.light,
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "FSW Store",
        ),
      );
    } catch (e) {
      logger.e("[StripePaymentHandle.initPaymentSheet]: $e");
      rethrow;
    }
  }
}
