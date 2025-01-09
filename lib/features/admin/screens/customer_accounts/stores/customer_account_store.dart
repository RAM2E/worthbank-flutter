import 'dart:async';
import 'dart:developer' as developer;

import 'package:banking_app_frontend/features/admin/screens/customer_accounts/manipulate_screens/createcustomer_screen.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/manipulate_screens/updatecustomer_screen.dart';
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/manipulate_screens/view_customer_details.dart';
import 'package:banking_app_frontend/features/customer/screens/dashboard_screen.dart';
import 'package:banking_app_frontend/shared/services/api_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'customer_account_store.g.dart';

class CustomerAccountsStore = _CustomerAccountsStore
    with _$CustomerAccountsStore;

abstract class _CustomerAccountsStore with Store {
  static const timeout = Duration(seconds: 30);

  Timer? _debounceTimer;
  static const _debounceTime = Duration(milliseconds: 500);

  @observable
  ObservableList<String> filteredAccountIds = ObservableList<String>();

  @observable
  String? selectedAccountId;

  @observable
  bool isBlocked = false;

  @observable
  bool isLoading = false;

  @observable
  bool isProcessing = false;

  @observable
  String backendMessage = '';

  @observable
  String errorMessage = '';

  @observable
  bool showRightSideForm = false;

  @observable
  Widget rightSideWidget = Container();

  @computed
  bool get isSelected => selectedAccountId != null;

  @computed
  bool get hasError => errorMessage.isNotEmpty;

  @computed
  bool get isActionable => !isLoading && !isProcessing;

  @action
  Future<void> searchAccounts(String query) async {
    _debounceTimer?.cancel();

    if (query.isEmpty) {
      runInAction(() => filteredAccountIds.clear());
      return;
    }

    _debounceTimer = Timer(_debounceTime, () async {
      try {
        isLoading = true;
        errorMessage = '';
        developer.log('Searching for query: $query');

        final response = await _timeoutOperation(
            ApiService.get('/api/admin/search?accountId=$query'));

        if (response == null) return;

        developer.log('Search response: $response');

        runInAction(() {
          filteredAccountIds.clear();
          if (response is List) {
            filteredAccountIds.addAll(
                response.map((account) => account['accountId'].toString()));
          } else if (response is Map && response.containsKey('accounts')) {
            final accounts = response['accounts'] as List;
            filteredAccountIds.addAll(
                accounts.map((account) => account['accountId'].toString()));
          }
          developer.log('Filtered accounts: ${filteredAccountIds.length}');
        });
      } catch (e) {
        developer.log('Search error: $e');
        errorMessage = 'Search failed: ${e.toString()}';
        filteredAccountIds.clear();
      } finally {
        isLoading = false;
      }
    });
  }

  @action
  Future<void> toggleBlockStatus() async {
    if (!isActionable || selectedAccountId == null) return;

    try {
      isProcessing = true;
      errorMessage = '';
      final response = await _timeoutOperation(
          ApiService.get('/api/admin/view/$selectedAccountId'));

      if (response == null) return;

      String status = response['status'] ?? 'active';
      isBlocked = (status == 'BLOCKED');

      if (isBlocked) {
        final unblockResponse = await _timeoutOperation(
            ApiService.post('/api/admin/unblock/$selectedAccountId', {}));
        if (unblockResponse == null) return;
        backendMessage =
            unblockResponse['message'] ?? 'Account unblocked successfully';
        isBlocked = false;
      } else {
        final blockResponse = await _timeoutOperation(
            ApiService.post('/api/admin/block/$selectedAccountId', {}));
        if (blockResponse == null) return;
        backendMessage =
            blockResponse['message'] ?? 'Account blocked successfully';
        isBlocked = true;
      }
    } catch (e) {
      errorMessage = 'Block/Unblock failed: ${e.toString()}';
    } finally {
      isProcessing = false;
    }
  }

  @action
  Future<void> viewCustomerDashboard() async {
    if (!isActionable || selectedAccountId == null) return;

    try {
      isProcessing = true;
      errorMessage = '';
      final response = await _timeoutOperation(
          ApiService.get('/api/admin/view/$selectedAccountId'));

      if (response == null) return;

      if (response.containsKey('fullName')) {
        runInAction(() {
          showRightSideForm = true;
          rightSideWidget = CustomerDashboard(
            key: ValueKey(selectedAccountId!),
            accountId: selectedAccountId!,
            fullName: response['fullName'],
            onClose: resetView,
          );
        });
      } else {
        errorMessage = 'Invalid response format';
      }
    } catch (e) {
      errorMessage = 'Dashboard loading failed: ${e.toString()}';
    } finally {
      isProcessing = false;
    }
  }

  @action
  Future<void> deleteAccount() async {
    if (!isActionable || selectedAccountId == null) return;

    try {
      isProcessing = true;
      errorMessage = '';
      final response = await _timeoutOperation(
          ApiService.delete('/api/admin/delete/$selectedAccountId'));

      if (response == null) return;

      runInAction(() {
        backendMessage = response['message'] ?? 'Account deleted successfully';
        filteredAccountIds.remove(selectedAccountId);
        selectedAccountId = null;
      });
    } catch (e) {
      errorMessage = 'Delete failed: ${e.toString()}';
    } finally {
      isProcessing = false;
    }
  }

  @action
  Future<void> viewAccount() async {
    if (!isActionable || selectedAccountId == null) return;

    try {
      isProcessing = true;
      errorMessage = '';
      final response = await _timeoutOperation(
          ApiService.get('/api/admin/view/$selectedAccountId'));

      if (response == null) return;

      runInAction(() {
        showRightSideForm = true;
        rightSideWidget = ViewAccountDetails(
          accountDetails: response,
          onClose: resetView,
        );
      });
    } catch (e) {
      errorMessage = 'View failed: ${e.toString()}';
    } finally {
      isProcessing = false;
    }
  }

  Future<T?> _timeoutOperation<T>(Future<T> operation) async {
    try {
      return await operation.timeout(
        timeout,
        onTimeout: () => throw TimeoutException('Operation timed out'),
      );
    } on TimeoutException {
      errorMessage = 'Operation timed out. Please try again.';
      return null;
    }
  }

  @action
  void createAccount() {
    showRightSideForm = true;
    rightSideWidget = CreateAccountForm(onClose: resetView);
  }

  @action
  void updateAccount() {
    if (selectedAccountId == null) return;
    showRightSideForm = true;
    rightSideWidget = UpdateAccountForm(
      accountId: selectedAccountId!,
      onClose: resetView,
    );
  }

  @action
  void selectAccount(String? accountId) {
    selectedAccountId = accountId;
    if (accountId != null) {
      fetchAccountStatus(accountId);
    }
  }

  @action
  Future<void> fetchAccountStatus(String accountId) async {
    try {
      errorMessage = '';
      final response =
          await _timeoutOperation(ApiService.get('/api/admin/view/$accountId'));

      if (response == null) return;

      runInAction(() {
        isBlocked = (response['status'] ?? 'active') == 'BLOCKED';
      });
    } catch (e) {
      errorMessage = 'Status fetch failed: ${e.toString()}';
    }
  }

  @action
  void resetView() {
    showRightSideForm = false;
    rightSideWidget = Container();
    backendMessage = '';
    errorMessage = '';
  }

  @action
  void reset() {
    filteredAccountIds.clear();
    selectedAccountId = null;
    isBlocked = false;
    showRightSideForm = false;
    rightSideWidget = Container();
    backendMessage = '';
    errorMessage = '';
    isLoading = false;
    isProcessing = false;
  }

  @action
  void dispose() {
    reset();
    filteredAccountIds = ObservableList<String>();
    rightSideWidget = Container();
  }
}
