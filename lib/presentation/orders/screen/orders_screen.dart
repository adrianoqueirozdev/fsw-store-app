import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/orders/orders_bloc.dart';
import 'package:fsw_store/presentation/_blocs/orders/orders_state.dart';
import 'package:fsw_store/presentation/orders/controllers/orders_controller.dart';
import 'package:fsw_store/presentation/orders/widgets/order_list.dart';
import 'package:fsw_store/presentation/orders/widgets/order_list_shimmer.dart';
import 'package:fsw_store/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      global: false,
      builder: (controller) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: preferredSizeAppBar(child: const DefaultAppBar()),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleScreen(
                  label: "Meus pedidos",
                  icon: Icons.shopping_basket_outlined,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<OrdersBloc, OrdersState>(
                    bloc: controller.ordersBloc,
                    builder: (context, state) {
                      return switch (state.runtimeType) {
                        OrdersInitialState => const OrderListShimmer(),
                        OrdersLoadedState => OrderList(orders: state.orders),
                        _ => const SizedBox.shrink()
                      };
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
