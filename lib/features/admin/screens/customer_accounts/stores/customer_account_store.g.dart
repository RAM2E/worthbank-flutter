// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerAccountsStore on _CustomerAccountsStore, Store {
  Computed<bool>? _$isSelectedComputed;

  @override
  bool get isSelected =>
      (_$isSelectedComputed ??= Computed<bool>(() => super.isSelected,
              name: '_CustomerAccountsStore.isSelected'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CustomerAccountsStore.hasError'))
          .value;
  Computed<bool>? _$isActionableComputed;

  @override
  bool get isActionable =>
      (_$isActionableComputed ??= Computed<bool>(() => super.isActionable,
              name: '_CustomerAccountsStore.isActionable'))
          .value;

  late final _$filteredAccountIdsAtom =
      Atom(name: '_CustomerAccountsStore.filteredAccountIds', context: context);

  @override
  ObservableList<String> get filteredAccountIds {
    _$filteredAccountIdsAtom.reportRead();
    return super.filteredAccountIds;
  }

  @override
  set filteredAccountIds(ObservableList<String> value) {
    _$filteredAccountIdsAtom.reportWrite(value, super.filteredAccountIds, () {
      super.filteredAccountIds = value;
    });
  }

  late final _$selectedAccountIdAtom =
      Atom(name: '_CustomerAccountsStore.selectedAccountId', context: context);

  @override
  String? get selectedAccountId {
    _$selectedAccountIdAtom.reportRead();
    return super.selectedAccountId;
  }

  @override
  set selectedAccountId(String? value) {
    _$selectedAccountIdAtom.reportWrite(value, super.selectedAccountId, () {
      super.selectedAccountId = value;
    });
  }

  late final _$isBlockedAtom =
      Atom(name: '_CustomerAccountsStore.isBlocked', context: context);

  @override
  bool get isBlocked {
    _$isBlockedAtom.reportRead();
    return super.isBlocked;
  }

  @override
  set isBlocked(bool value) {
    _$isBlockedAtom.reportWrite(value, super.isBlocked, () {
      super.isBlocked = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CustomerAccountsStore.isLoading', context: context);

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

  late final _$isProcessingAtom =
      Atom(name: '_CustomerAccountsStore.isProcessing', context: context);

  @override
  bool get isProcessing {
    _$isProcessingAtom.reportRead();
    return super.isProcessing;
  }

  @override
  set isProcessing(bool value) {
    _$isProcessingAtom.reportWrite(value, super.isProcessing, () {
      super.isProcessing = value;
    });
  }

  late final _$backendMessageAtom =
      Atom(name: '_CustomerAccountsStore.backendMessage', context: context);

  @override
  String get backendMessage {
    _$backendMessageAtom.reportRead();
    return super.backendMessage;
  }

  @override
  set backendMessage(String value) {
    _$backendMessageAtom.reportWrite(value, super.backendMessage, () {
      super.backendMessage = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CustomerAccountsStore.errorMessage', context: context);

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

  late final _$showRightSideFormAtom =
      Atom(name: '_CustomerAccountsStore.showRightSideForm', context: context);

  @override
  bool get showRightSideForm {
    _$showRightSideFormAtom.reportRead();
    return super.showRightSideForm;
  }

  @override
  set showRightSideForm(bool value) {
    _$showRightSideFormAtom.reportWrite(value, super.showRightSideForm, () {
      super.showRightSideForm = value;
    });
  }

  late final _$rightSideWidgetAtom =
      Atom(name: '_CustomerAccountsStore.rightSideWidget', context: context);

  @override
  Widget get rightSideWidget {
    _$rightSideWidgetAtom.reportRead();
    return super.rightSideWidget;
  }

  @override
  set rightSideWidget(Widget value) {
    _$rightSideWidgetAtom.reportWrite(value, super.rightSideWidget, () {
      super.rightSideWidget = value;
    });
  }

  late final _$searchAccountsAsyncAction =
      AsyncAction('_CustomerAccountsStore.searchAccounts', context: context);

  @override
  Future<void> searchAccounts(String query) {
    return _$searchAccountsAsyncAction.run(() => super.searchAccounts(query));
  }

  late final _$toggleBlockStatusAsyncAction =
      AsyncAction('_CustomerAccountsStore.toggleBlockStatus', context: context);

  @override
  Future<void> toggleBlockStatus() {
    return _$toggleBlockStatusAsyncAction.run(() => super.toggleBlockStatus());
  }

  late final _$viewCustomerDashboardAsyncAction = AsyncAction(
      '_CustomerAccountsStore.viewCustomerDashboard',
      context: context);

  @override
  Future<void> viewCustomerDashboard() {
    return _$viewCustomerDashboardAsyncAction
        .run(() => super.viewCustomerDashboard());
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('_CustomerAccountsStore.deleteAccount', context: context);

  @override
  Future<void> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$viewAccountAsyncAction =
      AsyncAction('_CustomerAccountsStore.viewAccount', context: context);

  @override
  Future<void> viewAccount() {
    return _$viewAccountAsyncAction.run(() => super.viewAccount());
  }

  late final _$fetchAccountStatusAsyncAction = AsyncAction(
      '_CustomerAccountsStore.fetchAccountStatus',
      context: context);

  @override
  Future<void> fetchAccountStatus(String accountId) {
    return _$fetchAccountStatusAsyncAction
        .run(() => super.fetchAccountStatus(accountId));
  }

  late final _$_CustomerAccountsStoreActionController =
      ActionController(name: '_CustomerAccountsStore', context: context);

  @override
  void createAccount() {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.createAccount');
    try {
      return super.createAccount();
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAccount() {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.updateAccount');
    try {
      return super.updateAccount();
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAccount(String? accountId) {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.selectAccount');
    try {
      return super.selectAccount(accountId);
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetView() {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.resetView');
    try {
      return super.resetView();
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.reset');
    try {
      return super.reset();
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CustomerAccountsStoreActionController.startAction(
        name: '_CustomerAccountsStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CustomerAccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredAccountIds: ${filteredAccountIds},
selectedAccountId: ${selectedAccountId},
isBlocked: ${isBlocked},
isLoading: ${isLoading},
isProcessing: ${isProcessing},
backendMessage: ${backendMessage},
errorMessage: ${errorMessage},
showRightSideForm: ${showRightSideForm},
rightSideWidget: ${rightSideWidget},
isSelected: ${isSelected},
hasError: ${hasError},
isActionable: ${isActionable}
    ''';
  }
}
