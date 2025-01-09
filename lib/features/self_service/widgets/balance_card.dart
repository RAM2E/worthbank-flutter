import 'package:banking_app_frontend/features/self_service/theme/selfservice_customer_dashboard_colors.dart';
import 'package:banking_app_frontend/features/self_service/utils/selfservice_customer_responsive.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final bool isLoading;

  const BalanceCard({
    Key? key,
    required this.balance,
    this.isLoading = false,
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
      child: Container(
        padding: SelfserviceCustomerResponsive.getCardPadding(context),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Balance',
              style: TextStyle(
                fontSize: SelfserviceCustomerResponsive.getLabelSize(context),
                color: SelfserviceCustomerDashboardColors.text,
              ),
            ),
            SizedBox(height: SelfserviceCustomerResponsive.getSpacing(context)),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(
                  color: SelfserviceCustomerDashboardColors.primary,
                ),
              )
            else
              Text(
                '\$${balance.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: SelfserviceCustomerResponsive.getHeadingSize(context),
                  fontWeight: FontWeight.bold,
                  color: SelfserviceCustomerDashboardColors.accent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
