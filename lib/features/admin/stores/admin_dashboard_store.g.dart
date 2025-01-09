// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminDashboardStore on _AdminDashboardStore, Store {
  Computed<Widget>? _$currentScreenComputed;

  @override
  Widget get currentScreen =>
      (_$currentScreenComputed ??= Computed<Widget>(() => super.currentScreen,
              name: '_AdminDashboardStore.currentScreen'))
          .value;
  Computed<String>? _$currentTitleComputed;

  @override
  String get currentTitle =>
      (_$currentTitleComputed ??= Computed<String>(() => super.currentTitle,
              name: '_AdminDashboardStore.currentTitle'))
          .value;
  Computed<IconData>? _$currentIconComputed;

  @override
  IconData get currentIcon =>
      (_$currentIconComputed ??= Computed<IconData>(() => super.currentIcon,
              name: '_AdminDashboardStore.currentIcon'))
          .value;
  Computed<bool>? _$canGoBackComputed;

  @override
  bool get canGoBack =>
      (_$canGoBackComputed ??= Computed<bool>(() => super.canGoBack,
              name: '_AdminDashboardStore.canGoBack'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_AdminDashboardStore.hasError'))
          .value;

  late final _$selectedIndexAtom =
      Atom(name: '_AdminDashboardStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AdminDashboardStore.isLoading', context: context);

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
      Atom(name: '_AdminDashboardStore.errorMessage', context: context);

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

  late final _$navigationHistoryAtom =
      Atom(name: '_AdminDashboardStore.navigationHistory', context: context);

  @override
  ObservableList<int> get navigationHistory {
    _$navigationHistoryAtom.reportRead();
    return super.navigationHistory;
  }

  @override
  set navigationHistory(ObservableList<int> value) {
    _$navigationHistoryAtom.reportWrite(value, super.navigationHistory, () {
      super.navigationHistory = value;
    });
  }

  late final _$_AdminDashboardStoreActionController =
      ActionController(name: '_AdminDashboardStore', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBack() {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.goBack');
    try {
      return super.goBack();
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearHistory() {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.clearHistory');
    try {
      return super.clearHistory();
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? message) {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.setError');
    try {
      return super.setError(message);
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool loading) {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.setLoading');
    try {
      return super.setLoading(loading);
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_AdminDashboardStoreActionController.startAction(
        name: '_AdminDashboardStore.resetState');
    try {
      return super.resetState();
    } finally {
      _$_AdminDashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
navigationHistory: ${navigationHistory},
currentScreen: ${currentScreen},
currentTitle: ${currentTitle},
currentIcon: ${currentIcon},
canGoBack: ${canGoBack},
hasError: ${hasError}
    ''';
  }
}
