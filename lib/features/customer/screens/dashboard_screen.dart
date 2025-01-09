import 'package:banking_app_frontend/features/customer/utils/customer_dashboard_color.dart';
import 'package:banking_app_frontend/features/customer/utils/customer_responsive.dart';
import 'package:banking_app_frontend/features/customer/widgets/action_buttons.dart';
import 'package:banking_app_frontend/features/self_service/widgets/account_info_card.dart';
import 'package:banking_app_frontend/features/self_service/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/customer_dashboard_store.dart';


class CustomerDashboard extends StatefulWidget {
  final String accountId;
  final String fullName;
  final VoidCallback onClose;

  const CustomerDashboard({
    required this.accountId,
    required this.fullName,
    required this.onClose,
    required Key key,
  }) : super(key: key);

  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  late CustomerDashboardStore _store;

  @override
  void initState() {
    super.initState();
    _store = context.read<CustomerDashboardStore>();
    _store.fetchBalance(widget.accountId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: CustomerDashboardResponsive.getScreenPadding(context),
        child: Column(
          children: [
            AccountInfoCard(
              accountId: widget.accountId,
              fullName: widget.fullName,
            ),
            SizedBox(height: CustomerDashboardResponsive.getSpacing(context)),
            Observer(
              builder: (_) => BalanceCard(
                balance: _store.balance,
                isLoading: _store.isLoading,
              ),
            ),
            SizedBox(height: CustomerDashboardResponsive.getSpacing(context)),
            Observer(
              builder: (_) => ActionButtons(
                accountId: widget.accountId,
                onDeposit: (amount) => _store.performTransaction(widget.accountId, 'deposit', amount),
                onWithdraw: (amount) => _store.performTransaction(widget.accountId, 'withdraw', amount),
                onSendMoney: (recipientId, amount) => _store.performTransaction(
                  widget.accountId, 
                  'send', 
                  amount, 
                  recipientId,
                ),
                isLoading: _store.isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        'Customer Dashboard',
        style: TextStyle(
          fontSize: CustomerDashboardResponsive.getHeaderSize(context),
          fontWeight: FontWeight.bold,
          color: CustomerDashboardColors.textLight,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: CustomerDashboardColors.headerGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: widget.onClose,
          color: CustomerDashboardColors.textLight,
        ),
      ],
      elevation: CustomerDashboardResponsive.getCardElevation(context),
    );
  }
}