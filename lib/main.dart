import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/app.dart';
import 'package:fsw_store/firebase_options.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/environment.dart';
import 'package:fsw_store/splash_loading.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:get_storage/get_storage.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashLoading());

  Intl.defaultLocale = 'pt_BR';
  Animate.restartOnHotReload = true;
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = Environment.stripePublishableKey;
  await ConfigsSupabase.initialize();

  runApp(const App());
}
