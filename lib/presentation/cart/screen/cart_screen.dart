import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/data/models/cart.dart';
import 'package:fsw_store/presentation/cart/widgets/cart_info.dart';
import 'package:fsw_store/presentation/cart/widgets/cart_item/cart_item.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartCubit, Cart>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleScreen(
                  label: "Carrinho",
                  icon: Icons.shopping_cart,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => CartItem(product: state.products[index]),
                  ),
                ),
                if (state.products.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      CartInfo(
                        text: "Subtotal",
                        value: "R\$ ${state.subtotal.toStringAsFixed(2)}",
                      ),
                      const Divider(),
                      const CartInfo(
                        text: "Entrega",
                        value: "GRÁTIS",
                      ),
                      const Divider(),
                      CartInfo(
                        text: "Descontos",
                        value: "- R\$ ${state.totalDiscount.toStringAsFixed(2)}",
                      ),
                      const Divider(),
                      CartInfo(
                        text: "Total",
                        value: "R\$ ${state.total.toStringAsFixed(2)}",
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => {},
                          child: const Text("FINALIZAR COMPRA"),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16)
              ],
            ),
          );
        },
      ),
    );
  }
}
