import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_state.dart';
import 'package:fsw_store/presentation/deals/deals_controller.dart';
import 'package:fsw_store/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/product_list_grid.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';
import 'package:get/get.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      init: DealsController(),
      builder: (controller) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: preferredSizeAppBar(child: const DefaultAppBar()),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleScreen(
                  label: "Ofertas",
                  icon: Icons.percent_outlined,
                ),
                const SizedBox(height: 16),
                BlocBuilder<ProductsOnOfferBloc, ProductsOnOfferState>(
                  bloc: controller.productsOnOfferBloc,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case ProductsOnOfferInitialState:
                        return const SizedBox.shrink();
                      case ProductsOnOfferLoadedState:
                        return ProductListGrid(products: state.products);
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
