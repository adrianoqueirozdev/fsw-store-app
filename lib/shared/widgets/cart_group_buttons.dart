import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/custom_icon_button.dart';

class CartGroupButtons extends StatelessWidget {
  final String value;
  final VoidCallback increase;
  final VoidCallback decrease;

  const CartGroupButtons({super.key, required this.value, required this.increase, required this.decrease});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.chevron_left,
          onPressed: decrease,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(value),
        ),
        CustomIconButton(
          icon: Icons.chevron_right,
          onPressed: increase,
        ),
      ],
    );
  }
}
