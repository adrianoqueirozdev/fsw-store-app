import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';

class IconButtonQuantity extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const IconButtonQuantity({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: null,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: AppColors.tertiary,
        ),
      ),
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
