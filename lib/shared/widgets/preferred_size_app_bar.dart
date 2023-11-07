import 'package:flutter/material.dart';

PreferredSizeWidget preferredSizeAppBar({required Widget child}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(72),
    child: child,
  );
}
