// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/presentation/cart/screen/cart_screen.dart';
import 'package:fsw_store/presentation/catalog/catalog_screen.dart';
import 'package:fsw_store/presentation/category_products/category_screen.dart';
import 'package:fsw_store/presentation/home/screen/home_screen.dart';
import 'package:fsw_store/presentation/product/screen/product_screen.dart';
import 'package:fsw_store/presentation/deals/deals_screen.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/environment.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/theme/styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_BR';

  await dotenv.load(fileName: Environment.fileName);

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Environment.apiKey,
      appId: Environment.appId,
      messagingSenderId: Environment.messagingSenderId,
      projectId: Environment.projectId,
      storageBucket: Environment.storageBucket,
    ),
  );

  Stripe.publishableKey = Environment.stripePublishableKey;

  await ConfigsSupabase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: GetMaterialApp(
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
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => const HomeScreen(),
          Routes.catalog: (context) => const CatalogScreen(),
          Routes.product: (context) => const ProductScreen(),
          Routes.deals: (context) => const DealsScreen(),
          Routes.categoryProducts: (context) => const CategoryProductsScreen(),
          Routes.cart: (context) => const CartScreen()
        },
      ),
    );
  }
}
