import 'package:banking_app_frontend/features/customer/utils/customer_dashboard_color.dart';
import 'package:banking_app_frontend/features/customer/utils/customer_responsive.dart';
import 'package:banking_app_frontend/shared/components/dialogs/transaction_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


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
    return Observer(
      builder: (_) => CustomerDashboardResponsive.isMobile(context)
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
      _buildActionButton(
        context: context,
        text: 'Deposit',
        icon: Icons.add,
        onPressed: () => _showTransactionDialog(
          context,
          'Deposit',
          onSubmit: onDeposit,
        ),
      ),
      SizedBox(width: CustomerDashboardResponsive.getSpacing(context)),
      _buildActionButton(
        context: context,
        text: 'Withdraw',
        icon: Icons.remove,
        onPressed: () => _showTransactionDialog(
          context,
          'Withdraw',
          onSubmit: onWithdraw,
        ),
      ),
      SizedBox(width: CustomerDashboardResponsive.getSpacing(context)),
      _buildActionButton(
        context: context,
        text: 'Send Money',
        icon: Icons.send,
        onPressed: () => _showTransactionDialog(
          context,
          'Send Money',
          showRecipient: true,
          onSubmitWithRecipient: onSendMoney,
        ),
      ),
    ];
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: CustomerDashboardResponsive.getButtonWidth(context),
      height: CustomerDashboardResponsive.getButtonHeight(context),
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomerDashboardColors.primary,
          padding: CustomerDashboardResponsive.getButtonPadding(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CustomerDashboardResponsive.getBorderRadius(context),
            ),
          ),
        ),
        icon: Icon(
          icon,
          size: CustomerDashboardResponsive.getIconSize(context),
          color: CustomerDashboardColors.textLight,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: CustomerDashboardResponsive.getBodySize(context),
            color: CustomerDashboardColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showTransactionDialog(
    BuildContext context,
    String title, {
    bool showRecipient = false,
    Function(double)? onSubmit,
    Function(String, double)? onSubmitWithRecipient,
  }) {
    showDialog(
      context: context,
      builder: (context) => TransactionDialog(
        title: title,
        showRecipient: showRecipient,
        onSubmit: (amount, recipientId) {
          if (showRecipient && onSubmitWithRecipient != null && recipientId != null) {
            onSubmitWithRecipient(recipientId, amount);
          } else if (!showRecipient && onSubmit != null) {
            onSubmit(amount);
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}