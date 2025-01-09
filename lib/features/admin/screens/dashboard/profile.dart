import 'package:banking_app_frontend/features/admin/utils/admin_dashboard_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/admin_responsive.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AdminResponsive.getContainerPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Settings',
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
            child: Padding(
              padding: AdminResponsive.getCardPadding(context),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: AdminResponsive.isDesktop(context) ? 60 : 50,
                    backgroundColor: AdminDashboardColors.primary,
                    child: Icon(
                      Icons.person,
                      size: AdminResponsive.isDesktop(context) ? 60 : 50,
                      color: AdminDashboardColors.textLight,
                    ),
                  ),
                  SizedBox(height: AdminResponsive.getSpacing(context)),
                  _buildProfileField(context, 'Name', 'Admin User'),
                  _buildProfileField(context, 'Email', 'admin@example.com'),
                  _buildProfileField(context, 'Role', 'Administrator'),
                  SizedBox(height: AdminResponsive.getSpacing(context)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AdminDashboardColors.primary,
                      padding: AdminResponsive.getPadding(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AdminResponsive.getBorderRadius(context),
                        ),
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: AdminResponsive.getBodySize(context),
                        color: AdminDashboardColors.textLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileField(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AdminResponsive.getSpacing(context) / 2,
      ),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: AdminResponsive.getBodySize(context),
              color: AdminDashboardColors.textGrey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AdminResponsive.getBodySize(context),
              color: AdminDashboardColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}