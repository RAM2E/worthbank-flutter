import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:banking_app_frontend/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/admin_dashboard_store.dart';
import '../../utils/admin_responsive.dart';
import '../../../../shared/sharedpref/shared_pref.dart';

class AppDrawer extends StatelessWidget {
  final AdminDashboardStore dashboardStore;

  const AppDrawer({
    Key? key,
    required this.dashboardStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AdminResponsive.getDrawerWidth(context),
      child: Drawer(
        elevation: 2,
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildMenu(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: AdminDashboardColors.primary,
      ),
      accountName: Text(
        'Ramu Ediga',
        style: TextStyle(
          fontSize: AdminResponsive.getHeadingSize(context),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      accountEmail: Text(
        'edigaramu9074@gmail.com.com',
        style: TextStyle(
          fontSize: AdminResponsive.getBodySize(context),
          color: Colors.white,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: AdminDashboardColors.surface,
        child: Icon(
          Icons.person,
          size: AdminResponsive.getIconSize(context),
          color: AdminDashboardColors.primary,
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Observer(
      builder: (_) => ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildMenuItem(
            context,
            Icons.dashboard,
            'Dashboard',
            0,
          ),
          _buildMenuItem(
            context,
            Icons.account_circle,
            'Customer Accounts',
            1,
          ),
          _buildMenuItem(
            context,
            Icons.security,
            'Permissions',
            2,
          ),
          _buildMenuItem(
            context,
            Icons.person,
            'Profile',
            3,
          ),
          const Divider(height: 1),
          _buildLogoutItem(context),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    int index,
  ) {
    final isSelected = dashboardStore.selectedIndex == index;

    return ListTile(
      leading: Icon(
        icon,
        size: AdminResponsive.getIconSize(context),
        color: isSelected
            ? AdminDashboardColors.primary
            : AdminDashboardColors.navUnselected,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AdminResponsive.getBodySize(context),
          color: isSelected
              ? AdminDashboardColors.primary
              : AdminDashboardColors.navUnselected,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AdminDashboardColors.primary.withOpacity(0.1),
      onTap: () {
        dashboardStore.setIndex(index);
        if (AdminResponsive.isMobile(context)) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.logout,
        size: AdminResponsive.getIconSize(context),
        color: Colors.red,
      ),
      title: Text(
        'Logout',
        style: TextStyle(
          fontSize: AdminResponsive.getBodySize(context),
          color: Colors.red,
        ),
      ),
      onTap: () async {
        await SharedPrefs.clearAll();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      },
    );
  }
}
