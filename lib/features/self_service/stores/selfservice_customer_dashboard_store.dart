import 'package:banking_app_frontend/features/auth/screens/login_screen.dart';
import 'package:banking_app_frontend/shared/services/api_service.dart';
import 'package:banking_app_frontend/shared/sharedpref/shared_pref.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'selfservice_customer_dashboard_store.g.dart';

class SelfServiceCustomerDashboardStore = _SelfServiceCustomerDashboardStore
    with _$SelfServiceCustomerDashboardStore;

abstract class _SelfServiceCustomerDashboardStore with Store {
  @observable
  double balance = 0.0;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchBalance(String accountId) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await ApiService.get('/api/customer/$accountId/balance');
      if (response['balance'] != null) {
        balance = (response['balance'] is String)
            ? double.tryParse(response['balance']) ?? 0.0
            : response['balance'].toDouble();
      }
    } catch (e) {
      errorMessage = 'Failed to fetch balance';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> deposit(String accountId, double amount) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await ApiService.postbalance(
        '/api/customer/$accountId/deposit',
        {'amount': amount.toString()},
      );
      if (response['statusCode'] == 200 && response['body'] != null) {
        if (response['body']['message'] == 'Amount deposited successfully') {
          balance += amount;
          return true;
        }
      }
      errorMessage = 'Deposit failed';
      return false;
    } catch (e) {
      errorMessage = 'Error processing deposit';
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> withdraw(String accountId, double amount) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await ApiService.postbalance(
        '/api/customer/$accountId/withdraw',
        {'amount': amount.toString()},
      );
      if (response['statusCode'] == 200 && response['body'] != null) {
        if (response['body']['message'] == 'Amount withdrawn successfully') {
          balance -= amount;
          return true;
        }
      }
      errorMessage = 'Withdrawal failed';
      return false;
    } catch (e) {
      errorMessage = 'Error processing withdrawal';
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> sendMoney(
      String accountId, String recipientAccountId, double amount) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await ApiService.postbalance(
        '/api/customer/$accountId/send-money',
        {
          'recipientAccountId': recipientAccountId,
          'amount': amount.toString(),
        },
      );
      if (response['statusCode'] == 200 && response['body'] != null) {
        if (response['body']['message'] == 'Money sent successfully') {
          balance -= amount;
          return true;
        }
      }
      errorMessage = 'Failed to send money';
      return false;
    } catch (e) {
      errorMessage = 'Error sending money';
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout(BuildContext context) async {
    await SharedPrefs.clearAll();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }
}