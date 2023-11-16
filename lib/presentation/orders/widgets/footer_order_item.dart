import 'package:flutter/material.dart';

class FooterOrderItem extends StatelessWidget {
  final String text;
  final String value;
  final TextStyle? style;

  const FooterOrderItem({
    super.key,
    required this.text,
    required this.value,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            text,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            value,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
