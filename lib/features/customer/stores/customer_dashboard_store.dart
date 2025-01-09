import 'package:banking_app_frontend/shared/services/api_service.dart';
import 'package:mobx/mobx.dart';

part 'customer_dashboard_store.g.dart';

class CustomerDashboardStore = _CustomerDashboardStore
    with _$CustomerDashboardStore;

abstract class _CustomerDashboardStore with Store {
  @observable
  double balance = 0.0;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> fetchBalance(String accountId) async {
    try {
      isLoading = true;
      final response =
          await ApiService.get('/api/admin/view/$accountId/balance');
      balance = response['balance'] ?? 0.0;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> performTransaction(String accountId, String type, double amount,
      [String? recipientId]) async {
    try {
      isLoading = true;
      switch (type) {
        case 'deposit':
          await ApiService.postbalance(
              '/api/admin/view/$accountId/deposit', {'amount': amount});
          break;
        case 'withdraw':
          await ApiService.postbalance(
              '/api/admin/view/$accountId/withdraw', {'amount': amount});
          break;
        case 'send':
          if (recipientId != null) {
            await ApiService.postbalance('/api/admin/send-money/$accountId',
                {'recipientAccountId': recipientId, 'amount': amount});
          }
          break;
      }
      await fetchBalance(accountId);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
