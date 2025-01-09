import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/admin_responsive.dart';

class AdminBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const AdminBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AdminDashboardColors.surface,
        boxShadow: AdminDashboardColors.cardShadow,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onIndexChanged,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AdminDashboardColors.surface,
        selectedItemColor: AdminDashboardColors.navSelected,
        unselectedItemColor: AdminDashboardColors.navUnselected,
        selectedFontSize: AdminResponsive.getBodySize(context),
        unselectedFontSize: AdminResponsive.getBodySize(context),
        iconSize: AdminResponsive.getIconSize(context),
        elevation: AdminResponsive.getCardElevation(context),
        items: [
          _buildNavItem(Icons.dashboard, 'Dashboard'),
          _buildNavItem(Icons.people, 'Accounts'),
          _buildNavItem(Icons.security, 'Permissions'),
          _buildNavItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}