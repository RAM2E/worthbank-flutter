
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/stores/customer_account_store.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/theme/customer_accounts_color.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/widgets/account_list.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/widgets/action_buttons.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomerAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CustomerAccountsStore>(
      create: (_) => CustomerAccountsStore(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const CustomerAccountsBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Customer Accounts',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomerAccountsColors.primary, CustomerAccountsColors.primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      centerTitle: true,
      elevation: 10,
    );
  }
}

class CustomerAccountsBody extends StatelessWidget {
  const CustomerAccountsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ActionButtons(),
          const SizedBox(height: 20),
          const SearchBarAccount(),
          const SizedBox(height: 20),
          Expanded(
            child: Observer(
              builder: (_) => Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: AccountList(),
                  ),
                  if (context.watch<CustomerAccountsStore>().showRightSideForm)
                    Flexible(
                      flex: 3,
                      child: context
                          .watch<CustomerAccountsStore>()
                          .rightSideWidget,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
