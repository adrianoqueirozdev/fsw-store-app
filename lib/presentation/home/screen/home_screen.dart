import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_state.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_state.dart';
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
                  BlocBuilder<ProductsOnOfferBloc, ProductsOnOfferState>(
                    bloc: controller.productsOnOfferBloc,
                    builder: (context, state) {
                      if (state is ProductsOnOfferInitialState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ProductsOnOfferLoadedState) {
                        final products = state.products;

                        return ProductList(products: products);
                      } else {
                        return const Center(
                          child: Text("Erro ao carregar produtos"),
                        );
                      }
                    },
                  ),

                  // Banner Mouses
                  const PromoBanner(assetName: AppImages.bannerMouses),
                  const SizedBox(height: 16),

                  // Teclados
                  const SectionTitle(text: "Teclados"),
                  BlocBuilder<ProductsKeyboardsBloc, ProductsKeyboardsState>(
                    bloc: controller.productsKeyboardsBloc,
                    builder: (context, state) {
                      if (state is ProductsKeyboardsInitialState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ProductsKeyboardsLoadedState) {
                        final products = state.productsKeyboards;

                        return ProductList(products: products);
                      } else {
                        return const Center(
                          child: Text("Erro ao carregar produtos"),
                        );
                      }
                    },
                  ),

                  // Banner Fones
                  const PromoBanner(assetName: AppImages.bannerHeadphones),
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
