import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fsw_store/presentation/catalog/catalog_screen.dart';
import 'package:fsw_store/presentation/home/screen/home_screen.dart';
import 'package:fsw_store/presentation/product/screen/product_screen.dart';
import 'package:fsw_store/presentation/deals/deals_screen.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/environment.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/theme/styles.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: Environment.fileName);

  await ConfigsSupabase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Styles.textTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.secondary,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.tertiary,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomeScreen(),
        Routes.catalog: (context) => const CatalogScreen(),
        Routes.product: (context) => const ProductScreen(),
        Routes.deals: (context) => const DealsScreen(),
      },
    );
  }
}
