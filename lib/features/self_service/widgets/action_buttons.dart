import 'package:banking_app_frontend/shared/components/dialogs/transaction_dailog.dart';
import 'package:flutter/material.dart';
import '../theme/selfservice_customer_dashboard_colors.dart';
import '../utils/selfservice_customer_responsive.dart';
import '../../../shared/components/buttons/custom_button.dart';

class ActionButtons extends StatelessWidget {
  final String accountId;
  final Function(double) onDeposit;
  final Function(double) onWithdraw;
  final Function(String, double) onSendMoney;
  final bool isLoading;

  const ActionButtons({
    Key? key,
    required this.accountId,
    required this.onDeposit,
    required this.onWithdraw,
    required this.onSendMoney,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SelfserviceCustomerResponsive.getPadding(context),
      child: SelfserviceCustomerResponsive.isMobile(context)
          ? Column(
              children: _buildButtons(context),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildButtons(context),
            ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    return [
      CustomButton(
        text: 'Deposit',
        icon: Icons.add_circle_outline,
        onPressed: () => _showTransactionDialog(context, 'Deposit'),
        isLoading: isLoading,
        width: SelfserviceCustomerResponsive.isMobile(context)
            ? double.infinity
            : SelfserviceCustomerResponsive.getButtonWidth(context),
        height: SelfserviceCustomerResponsive.getButtonHeight(context),
        backgroundColor: SelfserviceCustomerDashboardColors.primary,
      ),
      SizedBox(
        width: SelfserviceCustomerResponsive.getSpacing(context),
        height: SelfserviceCustomerResponsive.getSpacing(context),
      ),
      CustomButton(
        text: 'Withdraw',
        icon: Icons.remove_circle_outline,
        onPressed: () => _showTransactionDialog(context, 'Withdraw'),
        isLoading: isLoading,
        width: SelfserviceCustomerResponsive.isMobile(context)
            ? double.infinity
            : SelfserviceCustomerResponsive.getButtonWidth(context),
        height: SelfserviceCustomerResponsive.getButtonHeight(context),
        backgroundColor: SelfserviceCustomerDashboardColors.primary,
      ),
      SizedBox(
        width: SelfserviceCustomerResponsive.getSpacing(context),
        height: SelfserviceCustomerResponsive.getSpacing(context),
      ),
      CustomButton(
        text: 'Send Money',
        icon: Icons.send,
        onPressed: () => _showTransactionDialog(context, 'Send Money', showRecipient: true),
        isLoading: isLoading,
        width: SelfserviceCustomerResponsive.isMobile(context)
            ? double.infinity
            : SelfserviceCustomerResponsive.getButtonWidth(context),
        height: SelfserviceCustomerResponsive.getButtonHeight(context),
        backgroundColor: SelfserviceCustomerDashboardColors.primary,
      ),
    ];
  }

  void _showTransactionDialog(
    BuildContext context,
    String action, {
    bool showRecipient = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => TransactionDialog(
        title: action,
        showRecipient: showRecipient,
        onSubmit: (amount, recipientId) {
          switch (action) {
            case 'Deposit':
              onDeposit(amount);
              break;
            case 'Withdraw':
              onWithdraw(amount);
              break;
            case 'Send Money':
              if (recipientId != null) {
                onSendMoney(recipientId, amount);
              }
              break;
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}