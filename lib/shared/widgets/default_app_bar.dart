import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/data/models/cart.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/app_logo.dart';
import 'package:get/get.dart';

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
          onPressed: () => Get.toNamed(Routes.cart),
          icon: BlocBuilder<CartCubit, Cart>(
            builder: (context, state) {
              return Badge.count(
                backgroundColor: AppColors.primary,
                isLabelVisible: state.products.isNotEmpty,
                count: state.products.length,
                child: const Icon(Icons.shopping_cart),
              );
            },
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
