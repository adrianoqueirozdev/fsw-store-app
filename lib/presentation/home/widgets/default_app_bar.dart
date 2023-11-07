import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/shared/constants/app_images.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: SvgPicture.asset(
        AppImages.logo,
        width: 120,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            count: 3,
            child: const Icon(Icons.shopping_cart),
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(16),
        child: Divider(),
      ),
    );
  }
}
