import 'package:banking_app_frontend/features/admin/stores/admin_dashboard_store.dart';
import 'package:banking_app_frontend/features/admin/utils/admin_responsive.dart';
import 'package:banking_app_frontend/features/auth/screens/login_screen.dart';
import 'package:banking_app_frontend/shared/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'wigets/admin_dashboard_nav.dart';
import 'wigets/custom_app_bar.dart';
import 'wigets/app_drawer.dart';


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late AdminDashboardStore _dashboardStore;

  @override
  void initState() {
    super.initState();
    _dashboardStore = context.read<AdminDashboardStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: CustomAppBar(onLogout: _handleLogout),
        drawer: AdminResponsive.isMobile(context) 
          ? AppDrawer(dashboardStore: _dashboardStore)
          : null,
        body: Row(
          children: [
            if (!AdminResponsive.isMobile(context))
              AppDrawer(dashboardStore: _dashboardStore),
            Expanded(
              child: Container(
                padding: AdminResponsive.getPadding(context),
                child: _dashboardStore.currentScreen,
              ),
            ),
          ],
        ),
        bottomNavigationBar: AdminResponsive.isMobile(context)
          ? AdminBottomNav(
              selectedIndex: _dashboardStore.selectedIndex,
              onIndexChanged: (index) => _dashboardStore.setIndex(index),
            )
          : null,
      ),
    );
  }

  Future<void> _handleLogout() async {
    await SharedPrefs.clearAll();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
}