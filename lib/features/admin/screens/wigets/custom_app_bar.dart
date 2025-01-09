import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/admin_responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogout;

  const CustomAppBar({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AdminDashboardColors.primary,
      elevation: 0,
      title: Text(
        'Admin Dashboard',
        style: TextStyle(
          fontSize: AdminResponsive.getHeadingSize(context),
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          iconSize: AdminResponsive.getIconSize(context),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings),
          iconSize: AdminResponsive.getIconSize(context),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.logout),
          iconSize: AdminResponsive.getIconSize(context),
          onPressed: onLogout,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}