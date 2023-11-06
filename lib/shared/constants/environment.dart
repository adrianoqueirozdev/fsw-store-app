import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

sealed class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
  static String get supabaseProjectUrl => dotenv.env['SUPABASE_PROJECT_URL']!;
  static String get supabaseAnonPublicKey => dotenv.env['SUPABASE_ANON_PUBLIC_KEY']!;
}
