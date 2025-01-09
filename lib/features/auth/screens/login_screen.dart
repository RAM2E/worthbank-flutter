

import 'package:banking_app_frontend/core/theme/app_colors.dart';
import 'package:banking_app_frontend/core/utils/base_responsive.dart';
import 'package:banking_app_frontend/features/admin/screens/admin_dashboard_screen.dart';
import 'package:banking_app_frontend/features/auth/screens/login/widgets/admin_login_form.dart';
import 'package:banking_app_frontend/features/auth/screens/login/widgets/customer_login_form.dart';
import 'package:banking_app_frontend/features/auth/stores/auth_store.dart';
import 'package:banking_app_frontend/features/auth/utils/auth_responsive.dart';
import 'package:banking_app_frontend/features/self_service/self_service_cus_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AuthStore _authStore;

  @override
  void initState() {
    super.initState();
    _authStore = context.read<AuthStore>();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _handleAdminLoginSuccess() async {
    if (await _authStore.adminLogin(
      _authStore.emailController.text,
      _authStore.passwordController.text,
    )) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  AdminDashboard()),
      );
    }
  }

  void _handleCustomerLoginSuccess() async {
    if (await _authStore.customerLogin(
      _authStore.accountIdController.text,
      _authStore.passwordController.text,
    )) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SelfServiceCustomerDashboard(
            accountId: _authStore.accountIdController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: AuthResponsive.getLoginContainerWidth(context),
            height: AuthResponsive.getLoginContainerHeight(context),
            padding: AuthResponsive.getPadding(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.headerGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(
                AuthResponsive.getBorderRadius(context)
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryDark.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const CustomHeader(title: 'Login'),
                CustomTabs(
                  tabController: _tabController,
                  tabs: const ['Admin', 'Customer'],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AdminLoginForm(
                        authStore: _authStore,
                        onLoginSuccess: _handleAdminLoginSuccess,
                      ),
                      CustomerLoginForm(
                        authStore: _authStore,
                        onLoginSuccess: _handleCustomerLoginSuccess,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseResponsive.getPadding(context),
      child: Text(
        title,
        style: TextStyle(
          fontSize: BaseResponsive.getHeadingSize(context),
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}

class CustomTabs extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;

  const CustomTabs({
    Key? key,
    required this.tabController,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AuthResponsive.getLoginContainerWidth(context),
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.textLight,
        labelColor: AppColors.textLight,
        unselectedLabelColor: AppColors.textLight.withOpacity(0.6),
        labelStyle: TextStyle(
          fontSize: BaseResponsive.getBodySize(context),
        ),
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}