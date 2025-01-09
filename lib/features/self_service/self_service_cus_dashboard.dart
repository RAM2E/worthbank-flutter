import 'package:banking_app_frontend/features/self_service/stores/selfservice_customer_dashboard_store.dart';
import 'package:banking_app_frontend/features/self_service/theme/selfservice_customer_dashboard_colors.dart';
import 'package:banking_app_frontend/features/self_service/utils/selfservice_customer_responsive.dart';
import 'package:banking_app_frontend/features/self_service/widgets/account_info_card.dart';
import 'package:banking_app_frontend/features/self_service/widgets/balance_card.dart';
import 'package:banking_app_frontend/shared/components/dialogs/transaction_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../shared/components/buttons/custom_button.dart';


class SelfServiceCustomerDashboard extends StatefulWidget {
  final String accountId;
  
  const SelfServiceCustomerDashboard({
    Key? key,
    required this.accountId,
  }) : super(key: key);

  @override
  State<SelfServiceCustomerDashboard> createState() => _SelfServiceCustomerDashboardState();
}

class _SelfServiceCustomerDashboardState extends State<SelfServiceCustomerDashboard> {
  late SelfServiceCustomerDashboardStore _store;

  @override
  void initState() {
    super.initState();
    _store = context.read<SelfServiceCustomerDashboardStore>();
    _store.fetchBalance(widget.accountId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Self Service Dashboard',
          style: TextStyle(
            fontSize: SelfserviceCustomerResponsive.getHeadingSize(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: SelfserviceCustomerDashboardColors.headerGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            iconSize: SelfserviceCustomerResponsive.getIconSize(context),
            onPressed: () => _store.logout(context),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => _store.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: SelfserviceCustomerResponsive.getPadding(context),
                child: Center(
                  child: Container(
                    width: SelfserviceCustomerResponsive.getContainerWidth(context),
                    child: Column(
                      children: [
                        _buildAccountInfo(),
                        SizedBox(height: SelfserviceCustomerResponsive.getSpacing(context)),
                        _buildBalanceCard(),
                        SizedBox(height: SelfserviceCustomerResponsive.getSpacing(context)),
                        _buildActionButtons(),
                        if (_store.errorMessage != null)
                          Padding(
                            padding: EdgeInsets.only(
                              top: SelfserviceCustomerResponsive.getSpacing(context),
                            ),
                            child: Text(
                              _store.errorMessage!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: SelfserviceCustomerResponsive.getBodySize(context),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

    Widget _buildAccountInfo() {
    return AccountInfoCard(
      accountId: widget.accountId,
      fullName: 'Welcome back!', // Replace with actual name if available
    );
  }

  Widget _buildBalanceCard() {
    return BalanceCard(
      balance: _store.balance,
      isLoading: _store.isLoading,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          text: 'Deposit',
          icon: Icons.add,
          onPressed: () => _showTransactionDialog('Deposit'),
          width: SelfserviceCustomerResponsive.getButtonWidth(context),
        ),
        CustomButton(
          text: 'Withdraw',
          icon: Icons.remove,
          onPressed: () => _showTransactionDialog('Withdraw'),
          width: SelfserviceCustomerResponsive.getButtonWidth(context),
        ),
        CustomButton(
          text: 'Send',
          icon: Icons.send,
          onPressed: () => _showTransactionDialog('Send Money'),
          width: SelfserviceCustomerResponsive.getButtonWidth(context),
        ),
      ],
    );
  }

 void _showTransactionDialog(String action) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => TransactionDialog(
        title: action, // Changed from action to title
        showRecipient: action == 'Send Money',
        onSubmit: (amount, recipientId) async {
          try {
            switch (action) {
              case 'Deposit':
                await _store.deposit(widget.accountId, amount);
                break;
              case 'Withdraw':
                await _store.withdraw(widget.accountId, amount);
                break;
              case 'Send Money':
                if (recipientId != null) {
                  await _store.sendMoney(widget.accountId, recipientId, amount);
                } else {
                  throw Exception('Recipient ID is required');
                }
                break;
            }
            if (mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$action successful')),
              );
            }
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$action failed: ${e.toString()}')),
              );
            }
          }
        },
      ),
    );
  }
}