import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/presentation/home/controllers/home_controller.dart';
import 'package:fsw_store/presentation/home/widgets/categories.dart';
import 'package:fsw_store/presentation/home/widgets/promo_banner.dart';
import 'package:fsw_store/shared/constants/app_images.dart';

import 'package:fsw_store/shared/widgets/product_list.dart';
import 'package:fsw_store/shared/widgets/section_title.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Ofertas
                  const PromoBanner(assetName: AppImages.bannerOffers),
                  const SizedBox(height: 16),

                  // Lista de categorias
                  Categories(categoriesBloc: controller.categoriesBloc),
                  const SizedBox(height: 16),

                  // Ofertas
                  const SectionTitle(text: "Ofertas"),
                  ProductList(productsBloc: controller.productsBloc),

                  // Banner Mouses
                  const PromoBanner(assetName: AppImages.bannerMouses),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
