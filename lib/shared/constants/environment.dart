import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

sealed class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get supabaseProjectUrl => dotenv.env['SUPABASE_PROJECT_URL']!;
  static String get supabaseAnonPublicKey => dotenv.env['SUPABASE_ANON_PUBLIC_KEY']!;
  static String get stripePublishableKey => dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  static String get stripeSecretKey => dotenv.env['STRIPE_SECRET_KEY']!;
  static String get stripeApiBaseUrl => dotenv.env['STRIPE_API_BASE_URL']!;

  // Firebase
  static String get apiKey => dotenv.env['FIREBASE_API_KEY']!;
  static String get appId => dotenv.env['FIREBASE_APP_ID']!;
  static String get messagingSenderId => dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!;
  static String get projectId => dotenv.env['FIREBASE_PROJECT_ID']!;
  static String get storageBucket => dotenv.env['FIREBASE_STORAGE_BUCKET']!;
}
