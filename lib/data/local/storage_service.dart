import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  /// Save a value to shared preferences
  Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    log('Saved: $key = $value');
  }

  /// Read a value from shared preferences
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    log('Read: $key = $value');
    return value;
  }

  /// Remove a specific key from shared preferences
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    log('Removed: $key');
  }

  /// Clear all keys from shared preferences
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    log('Cleared all keys');
  }
}
