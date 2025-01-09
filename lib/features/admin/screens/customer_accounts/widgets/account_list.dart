import 'package:banking_app_frontend/features/admin/screens/customer_accounts/stores/customer_account_store.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/theme/customer_accounts_color.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/utils/customer_account_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class AccountList extends StatelessWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CustomerAccountsStore>(context);

    return Observer(
      builder: (_) => Column(
        children: [
          Expanded(
            child: store.isLoading 
              ? Center(
                  child: CircularProgressIndicator(
                    color: CustomerAccountsColors.primary,
                  ),
                )
              : store.filteredAccountIds.isNotEmpty
                ? ListView.builder(
                    itemCount: store.filteredAccountIds.length,
                    itemBuilder: (context, index) {
                      final accountId = store.filteredAccountIds[index];
                      return Observer(
                        builder: (_) {
                          final isSelected = store.selectedAccountId == accountId;
                          return Card(
                            elevation: isSelected 
                              ? CustomerAccountsResponsive.getCardElevation(context) 
                              : 1,
                            margin: CustomerAccountsResponsive.getListItemPadding(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                CustomerAccountsResponsive.getBorderRadius(context)
                              ),
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                value: isSelected,
                                onChanged: (bool? value) {
                                  store.selectAccount(value == true ? accountId : null);
                                },
                                activeColor: CustomerAccountsColors.primary,
                              ),
                              title: Text(
                                'Account ID: $accountId',
                                style: TextStyle(
                                  fontSize: CustomerAccountsResponsive.getBodySize(context),
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected 
                                    ? CustomerAccountsColors.primary 
                                    : CustomerAccountsColors.text,
                                ),
                              ),
                              selected: isSelected,
                              selectedTileColor: CustomerAccountsColors.primary.withOpacity(0.05),
                              onTap: () => store.selectAccount(isSelected ? null : accountId),
                            ),
                          );
                        },
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: CustomerAccountsResponsive.getBodySize(context),
                        color: CustomerAccountsColors.text,
                      ),
                    ),
                  ),
          ),
          if (store.errorMessage.isNotEmpty)
            Padding(
              padding: CustomerAccountsResponsive.getScreenPadding(context),
              child: Text(
                store.errorMessage,
                style: TextStyle(
                  color: CustomerAccountsColors.error,
                  fontSize: CustomerAccountsResponsive.getBodySize(context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}