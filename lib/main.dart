

import 'package:banking_app_frontend/core/theme/app_colors.dart';
import 'package:banking_app_frontend/features/admin/screens/admin_dashboard_screen.dart';
import 'package:banking_app_frontend/features/admin/stores/admin_dashboard_store.dart';
import 'package:banking_app_frontend/features/auth/screens/login_screen.dart';
import 'package:banking_app_frontend/features/auth/stores/auth_store.dart';
import 'package:banking_app_frontend/features/self_service/self_service_cus_dashboard.dart';
import 'package:banking_app_frontend/features/self_service/stores/selfservice_customer_dashboard_store.dart';
import 'package:banking_app_frontend/shared/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/customer/stores/customer_dashboard_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (_) => AuthStore(),
          dispose: (_, store) => store.dispose(),
        ),
        Provider<AdminDashboardStore>(
          create: (_) => AdminDashboardStore(),
        ),
        Provider<SelfServiceCustomerDashboardStore>(
          create: (_) => SelfServiceCustomerDashboardStore(),
        ),
        Provider<CustomerDashboardStore>(
          create: (_) => CustomerDashboardStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Banking App',
        theme: _buildTheme(),
        home: FutureBuilder<bool>(
          future: _checkAuthState(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (!snapshot.data!) {
              return const LoginScreen();
            }

            return _handleNavigation();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  Future<bool> _checkAuthState() async {
    final token = await SharedPrefs.getToken();
    return token != null && token.isNotEmpty;
  }

  Widget _handleNavigation() {
    final userRole = SharedPrefs.getUserRole();
    
    switch (userRole) {
      case 'ADMIN':
        return const AdminDashboard();
      case 'CUSTOMER':
        final accountId = SharedPrefs.getAccountId();
        return SelfServiceCustomerDashboard(
          accountId: accountId ?? '',
        );
      default:
        return const LoginScreen();
    }
  }

  ThemeData _buildTheme() {
    return ThemeData(
      primarySwatch: AppColors.brand,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textGrey,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(width: 2.0),
        errorBorder: _buildBorder(color: AppColors.error),
        contentPadding: const EdgeInsets.all(16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({
    Color color = AppColors.primary,
    double width = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}