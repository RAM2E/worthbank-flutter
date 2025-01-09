import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  // Keys
  static const String TOKEN_KEY = 'auth_token';
  static const String USER_ROLE_KEY = 'user_role';
  static const String ACCOUNT_ID_KEY = 'account_id';
  static const String USER_EMAIL_KEY = 'user_email';

  // Initialization
  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      print('SharedPrefs initialized successfully');
    } catch (e) {
      print('Error initializing SharedPrefs: $e');
      throw Exception('Failed to initialize SharedPrefs');
    }
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('SharedPrefs not initialized. Call SharedPrefs.init() first.');
    }
    return _prefs!;
  }

  // Token Management
  static Future<void> saveToken(String token) async {
    await prefs.setString(TOKEN_KEY, token);
  }

  static String? getToken() {
    return prefs.getString(TOKEN_KEY);
  }

  static Future<void> removeToken() async {
    await prefs.remove(TOKEN_KEY);
  }

  // User Role Management
  static Future<void> saveUserRole(String role) async {
    await prefs.setString(USER_ROLE_KEY, role);
  }

  static String? getUserRole() {
    return prefs.getString(USER_ROLE_KEY);
  }

  static Future<void> removeUserRole() async {
    await prefs.remove(USER_ROLE_KEY);
  }

  // Account Management
  static Future<void> saveAccountId(String id) async {
    await prefs.setString(ACCOUNT_ID_KEY, id);
  }

  static String? getAccountId() {
    return prefs.getString(ACCOUNT_ID_KEY);
  }

  static Future<void> removeAccountId() async {
    await prefs.remove(ACCOUNT_ID_KEY);
  }

  // Email Management
  static Future<void> saveUserEmail(String email) async {
    await prefs.setString(USER_EMAIL_KEY, email);
  }

  static String? getUserEmail() {
    return prefs.getString(USER_EMAIL_KEY);
  }

  static Future<void> removeUserEmail() async {
    await prefs.remove(USER_EMAIL_KEY);
  }

  // Session Management
  static Future<bool> isLoggedIn() async {
    final token = getToken();
    final role = getUserRole();
    return token != null && token.isNotEmpty && role != null;
  }

  static bool isAdmin() {
    try {
      return getUserRole() == 'ADMIN';
    } catch (e) {
      return false;
    }
  }

  static bool isCustomer() {
    try {
      return getUserRole() == 'CUSTOMER';
    } catch (e) {
      return false;
    }
  }

  // Clear All Data
  static Future<void> clearAll() async {
    try {
      await prefs.clear();
    } catch (e) {
      print('Error clearing preferences: $e');
      throw Exception('Failed to clear SharedPrefs');
    }
  }
}