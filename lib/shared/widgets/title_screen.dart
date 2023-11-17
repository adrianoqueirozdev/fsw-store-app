import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';

class TitleScreen extends StatelessWidget {
  final String label;
  final IconData icon;

  const TitleScreen({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppColors.secondary,
      shape: const StadiumBorder(),
      side: const BorderSide(color: AppColors.primary),
      avatar: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
