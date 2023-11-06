import 'package:flutter/material.dart';
import 'package:fsw_store/presentation/home/screen/home_screen.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/theme/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Styles.textTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.secondary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.tertiary,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
