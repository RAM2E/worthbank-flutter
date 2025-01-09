import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/admin_responsive.dart';

class Permissions extends StatelessWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AdminResponsive.getContainerPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Permissions',
            style: TextStyle(
              fontSize: AdminResponsive.getHeadingSize(context),
              fontWeight: FontWeight.bold,
              color: AdminDashboardColors.textDark,
            ),
          ),
          SizedBox(height: AdminResponsive.getSpacing(context)),
          Card(
            elevation: AdminResponsive.getCardElevation(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AdminResponsive.getBorderRadius(context),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              padding: AdminResponsive.getCardPadding(context),
              itemCount: 5,
              separatorBuilder: (context, index) => Divider(
                color: AdminDashboardColors.divider,
                height: AdminResponsive.getSpacing(context),
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'User ${index + 1}',
                    style: TextStyle(
                      fontSize: AdminResponsive.getBodySize(context),
                      color: AdminDashboardColors.textDark,
                    ),
                  ),
                  subtitle: Text(
                    'Role: Customer',
                    style: TextStyle(
                      fontSize: AdminResponsive.getBodySize(context),
                      color: AdminDashboardColors.textGrey,
                    ),
                  ),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AdminDashboardColors.primary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}