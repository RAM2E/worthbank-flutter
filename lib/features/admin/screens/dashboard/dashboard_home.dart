import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:banking_app_frontend/features/admin/utils/admin_responsive.dart';
import 'package:flutter/material.dart';


class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AdminResponsive.getContainerPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: TextStyle(
              fontSize: AdminResponsive.getHeadingSize(context),
              fontWeight: FontWeight.bold,
              color: AdminDashboardColors.textDark,
            ),
          ),
          SizedBox(height: AdminResponsive.getSpacing(context)),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: AdminResponsive.getGridCount(context),
            crossAxisSpacing: AdminResponsive.getSpacing(context),
            mainAxisSpacing: AdminResponsive.getSpacing(context),
            children: [
              _buildStatsCard(context, 'Total Users', '1,234'),
              _buildStatsCard(context, 'Active Accounts', '987'),
              _buildStatsCard(context, 'New Requests', '45'),
              _buildStatsCard(context, 'Support Tickets', '12'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, String title, String value) {
    return Card(
      elevation: AdminResponsive.getCardElevation(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AdminResponsive.getBorderRadius(context),
        ),
      ),
      child: Padding(
        padding: AdminResponsive.getCardPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AdminResponsive.getBodySize(context),
                color: AdminDashboardColors.textGrey,
              ),
            ),
            SizedBox(height: AdminResponsive.getSpacing(context)),
            Text(
              value,
              style: TextStyle(
                fontSize: AdminResponsive.getHeadingSize(context),
                fontWeight: FontWeight.bold,
                color: AdminDashboardColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}