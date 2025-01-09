class AppConfig {
  static const String devBaseUrl =
      'http://localhost:8080/api/accounts'; // Development URL
  static const String prodBaseUrl =
      'https://banking.com/api/accounts'; // Production URL

  static const bool isProduction =
      false; // Toggle between development and production

  static String get baseUrl => isProduction ? prodBaseUrl : devBaseUrl;
}
