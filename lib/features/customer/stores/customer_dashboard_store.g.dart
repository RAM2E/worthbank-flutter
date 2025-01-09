// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerDashboardStore on _CustomerDashboardStore, Store {
  late final _$balanceAtom =
      Atom(name: '_CustomerDashboardStore.balance', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_CustomerDashboardStore.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_CustomerDashboardStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchBalanceAsyncAction =
      AsyncAction('_CustomerDashboardStore.fetchBalance', context: context);

  @override
  Future<void> fetchBalance(String accountId) {
    return _$fetchBalanceAsyncAction.run(() => super.fetchBalance(accountId));
  }

  late final _$performTransactionAsyncAction = AsyncAction(
      '_CustomerDashboardStore.performTransaction',
      context: context);

  @override
  Future<void> performTransaction(String accountId, String type, double amount,
      [String? recipientId]) {
    return _$performTransactionAsyncAction.run(
        () => super.performTransaction(accountId, type, amount, recipientId));
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
