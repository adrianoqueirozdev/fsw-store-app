import 'package:fsw_store/shared/constants/environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class ConfigsSupabase {
  static initialize() async {
    await Supabase.initialize(
      url: Environment.supabaseProjectUrl,
      anonKey: Environment.supabaseAnonPublicKey,
    );
  }
}

final supabase = Supabase.instance.client;
