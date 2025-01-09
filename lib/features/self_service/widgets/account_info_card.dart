import 'package:banking_app_frontend/features/self_service/theme/selfservice_customer_dashboard_colors.dart';
import 'package:banking_app_frontend/features/self_service/utils/selfservice_customer_responsive.dart';
import 'package:flutter/material.dart';

class AccountInfoCard extends StatelessWidget {
  final String accountId;
  final String fullName;

  const AccountInfoCard({
    Key? key,
    required this.accountId,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SelfserviceCustomerResponsive.getBorderRadius(context),
        ),
      ),
      child: Padding(
        padding: SelfserviceCustomerResponsive.getCardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account ID: $accountId',
              style: TextStyle(
                fontSize: SelfserviceCustomerResponsive.getHeadingSize(context),
                fontWeight: FontWeight.bold,
                color: SelfserviceCustomerDashboardColors.primary,
              ),
            ),
            SizedBox(height: SelfserviceCustomerResponsive.getSpacing(context)),
            Text(
              'Account Holder: $fullName',
              style: TextStyle(
                fontSize: SelfserviceCustomerResponsive.getBodySize(context),
                color: SelfserviceCustomerDashboardColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}