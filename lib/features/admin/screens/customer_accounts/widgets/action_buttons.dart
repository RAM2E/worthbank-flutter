import 'package:banking_app_frontend/features/admin/screens/customer_accounts/stores/customer_account_store.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/theme/customer_accounts_color.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/utils/customer_account_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CustomerAccountsStore>(context);
    
    return Observer(
      builder: (_) {
        final buttons = [
          _buildButton(
            context: context,
            text: 'Create',
            color: CustomerAccountsColors.primary,
            onPressed: () => store.createAccount(),
          ),
          _buildButton(
            context: context,
            text: 'View',
            color: CustomerAccountsColors.accent,
            onPressed: store.isSelected ? () => store.viewAccount() : null,
          ),
          _buildButton(
            context: context,
            text: 'Update',
            color: CustomerAccountsColors.accent,
            onPressed: store.isSelected ? () => store.updateAccount() : null,
          ),
          _buildButton(
            context: context,
            text: 'Delete',
            color: CustomerAccountsColors.error,
            onPressed: store.isSelected ? () => store.deleteAccount() : null,
          ),
          _buildButton(
            context: context,
            text: store.isSelected ? (store.isBlocked ? 'Unblock' : 'Block') : 'Block',
            color: store.isSelected 
              ? (store.isBlocked ? CustomerAccountsColors.accent : CustomerAccountsColors.error)
              : CustomerAccountsColors.divider,
            onPressed: store.isSelected ? () => store.toggleBlockStatus() : null,
          ),
          _buildButton(
            context: context,
            text: 'Dashboard',
            color: CustomerAccountsColors.primary,
            onPressed: store.isSelected ? () => store.viewCustomerDashboard() : null,
          ),
        ];

        return CustomerAccountsResponsive.isMobile(context)
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buttons.map((button) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomerAccountsResponsive.getListSpacing(context) / 2,
                    ),
                    child: button,
                  )).toList(),
                ),
              )
            : Wrap(
                spacing: CustomerAccountsResponsive.getListSpacing(context),
                runSpacing: CustomerAccountsResponsive.getListSpacing(context),
                alignment: WrapAlignment.center,
                children: buttons,
              );
      },
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: CustomerAccountsResponsive.getButtonPadding(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            CustomerAccountsResponsive.getBorderRadius(context)
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: CustomerAccountsColors.textLight,
          fontWeight: FontWeight.bold,
          fontSize: CustomerAccountsResponsive.getBodySize(context),
        ),
      ),
    );
  }
}