import 'package:flutter/material.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/app_logo.dart';
import 'package:fsw_store/shared/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double statusBarHeight = MediaQuery.paddingOf(context).top;

    return Drawer(
      backgroundColor: AppColors.secondary,
      surfaceTintColor: AppColors.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: statusBarHeight + 16),
            width: double.infinity,
            height: statusBarHeight + 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogo(width: 140),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adriano Queiroz",
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Boas compras!",
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 0,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                DrawerItem(
                  title: "Fazer Login",
                  icon: Icons.login_outlined,
                  onTap: () {},
                ),
                DrawerItem(
                  title: "Início",
                  icon: Icons.home_outlined,
                  onTap: () {},
                ),
                DrawerItem(
                  title: "Meus Pedidos",
                  icon: Icons.inventory_2_outlined,
                  onTap: () {},
                ),
                DrawerItem(
                  title: "Ofertas",
                  icon: Icons.percent_outlined,
                  onTap: () {},
                ),
                DrawerItem(
                  title: "Catálogo",
                  icon: Icons.list_outlined,
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
