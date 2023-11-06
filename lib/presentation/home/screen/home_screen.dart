import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/shared/constants/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                AppImages.bannerHome01,
                width: size.width,
              ),
            )
          ],
        ),
      ),
    );
  }
}
