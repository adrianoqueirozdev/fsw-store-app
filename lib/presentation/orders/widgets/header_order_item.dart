import 'package:flutter/material.dart';

class HeaderOrderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? subtitleColor;

  const HeaderOrderItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.labelSmall,
        ),
        Text(
          subtitle,
          style: textTheme.labelSmall?.copyWith(
            color: subtitleColor ?? Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
