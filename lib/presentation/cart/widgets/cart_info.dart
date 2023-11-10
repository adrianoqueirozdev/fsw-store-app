import 'package:flutter/material.dart';

class CartInfo extends StatelessWidget {
  final String text;
  final String value;
  final TextStyle? style;

  const CartInfo({super.key, required this.text, required this.value, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: style,
        ),
        Text(
          value,
          style: style,
        ),
      ],
    );
  }
}
