import 'package:banking_app_frontend/features/admin/screens/customer_accounts/stores/customer_account_store.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/theme/customer_accounts_color.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/utils/customer_account_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class SearchBarAccount extends StatelessWidget {
  const SearchBarAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CustomerAccountsStore>(context);

    return Observer(
      builder: (_) => SizedBox(
        width: CustomerAccountsResponsive.getFieldWidth(context),
        child: TextField(
          onChanged: store.searchAccounts,
          decoration: InputDecoration(
            labelText: 'Search Account IDs',
            labelStyle: TextStyle(
              fontSize: CustomerAccountsResponsive.getBodySize(context),
              color: CustomerAccountsColors.text,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomerAccountsResponsive.getBorderRadius(context),
              ),
              borderSide: BorderSide(
                color: CustomerAccountsColors.searchBarBorder,
              ),
            ),
            contentPadding: CustomerAccountsResponsive.getFieldPadding(context),
            suffixIcon: store.isLoading 
              ? SizedBox(
                  width: CustomerAccountsResponsive.getIconSize(context),
                  height: CustomerAccountsResponsive.getIconSize(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomerAccountsColors.primary
                      ),
                    ),
                  ),
                )
              : Icon(
                  Icons.search,
                  color: CustomerAccountsColors.primary,
                  size: CustomerAccountsResponsive.getIconSize(context),
                ),
            errorText: store.errorMessage.isNotEmpty ? store.errorMessage : null,
            errorStyle: TextStyle(
              color: CustomerAccountsColors.error,
              fontSize: CustomerAccountsResponsive.getBodySize(context),
            ),
          ),
        ),
      ),
    );
  }
}