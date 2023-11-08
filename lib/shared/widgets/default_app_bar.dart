import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/app_logo.dart';

class DefaultAppBar extends StatelessWidget {
  final bool showDivider;

  const DefaultAppBar({super.key, this.showDivider = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const AppLogo(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            count: 3,
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ],
      bottom: showDivider
          ? const PreferredSize(
              preferredSize: Size.fromHeight(16),
              child: Divider(),
            )
          : null,
    );
  }
}
