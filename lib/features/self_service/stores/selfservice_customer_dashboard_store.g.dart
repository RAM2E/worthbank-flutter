// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfservice_customer_dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelfServiceCustomerDashboardStore
    on _SelfServiceCustomerDashboardStore, Store {
  late final _$balanceAtom = Atom(
      name: '_SelfServiceCustomerDashboardStore.balance', context: context);

  @override
  double get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$isLoadingAtom = Atom(
      name: '_SelfServiceCustomerDashboardStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: '_SelfServiceCustomerDashboardStore.errorMessage',
      context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchBalanceAsyncAction = AsyncAction(
      '_SelfServiceCustomerDashboardStore.fetchBalance',
      context: context);

  @override
  Future<void> fetchBalance(String accountId) {
    return _$fetchBalanceAsyncAction.run(() => super.fetchBalance(accountId));
  }

  late final _$depositAsyncAction = AsyncAction(
      '_SelfServiceCustomerDashboardStore.deposit',
      context: context);

  @override
  Future<bool> deposit(String accountId, double amount) {
    return _$depositAsyncAction.run(() => super.deposit(accountId, amount));
  }

  late final _$withdrawAsyncAction = AsyncAction(
      '_SelfServiceCustomerDashboardStore.withdraw',
      context: context);

  @override
  Future<bool> withdraw(String accountId, double amount) {
    return _$withdrawAsyncAction.run(() => super.withdraw(accountId, amount));
  }

  late final _$sendMoneyAsyncAction = AsyncAction(
      '_SelfServiceCustomerDashboardStore.sendMoney',
      context: context);

  @override
  Future<bool> sendMoney(
      String accountId, String recipientAccountId, double amount) {
    return _$sendMoneyAsyncAction
        .run(() => super.sendMoney(accountId, recipientAccountId, amount));
  }

  late final _$logoutAsyncAction = AsyncAction(
      '_SelfServiceCustomerDashboardStore.logout',
      context: context);

  @override
  Future<void> logout(BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  @override
  String toString() {
    return '''
balance: ${balance},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
