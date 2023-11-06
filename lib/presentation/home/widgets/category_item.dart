import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/category.dart';
import 'package:fsw_store/shared/constants/category_icon.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.tertiary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CategoryIcon.categoryIcon[category.slug],
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              category.name!,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
