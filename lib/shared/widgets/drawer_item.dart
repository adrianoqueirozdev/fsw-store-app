import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItem({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.tertiary,
            ),
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Text(
                title,
                style: textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
