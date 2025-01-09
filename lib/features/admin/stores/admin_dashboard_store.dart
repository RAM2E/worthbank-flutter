
import 'package:banking_app_frontend/features/admin/screens/customer_accounts/customer_accounts_screen.dart';
import 'package:banking_app_frontend/features/admin/screens/dashboard/dashboard_home.dart';
import 'package:banking_app_frontend/features/admin/screens/dashboard/permissions.dart';
import 'package:banking_app_frontend/features/admin/screens/dashboard/profile.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'admin_dashboard_store.g.dart';

class AdminDashboardStore = _AdminDashboardStore with _$AdminDashboardStore;

abstract class _AdminDashboardStore with Store {
  // Screen Definitions
  final List<Widget> screens = [
    DashboardHome(),
    CustomerAccounts(),
    Permissions(),
    Profile(),
  ];

  final List<String> screenTitles = [
    'Dashboard',
    'Customer Accounts',
    'Permissions',
    'Profile',
  ];

  final List<IconData> screenIcons = [
    Icons.dashboard,
    Icons.people,
    Icons.security,
    Icons.person,
  ];

  // Observables
  @observable
  int selectedIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<int> navigationHistory = ObservableList<int>();

  // Computed Values
  @computed
  Widget get currentScreen => screens[selectedIndex];

  @computed
  String get currentTitle => screenTitles[selectedIndex];

  @computed
  IconData get currentIcon => screenIcons[selectedIndex];

  @computed
  bool get canGoBack => navigationHistory.isNotEmpty;

  @computed
  bool get hasError => errorMessage != null;

  // Actions
  @action
  void setIndex(int index) {
    if (index >= 0 && index < screens.length) {
      navigationHistory.add(selectedIndex);
      selectedIndex = index;
      errorMessage = null;
    }
  }

  @action
  void goBack() {
    if (canGoBack) {
      selectedIndex = navigationHistory.removeLast();
      errorMessage = null;
    }
  }

  @action
  void clearHistory() {
    navigationHistory.clear();
  }

  @action
  void setError(String? message) {
    errorMessage = message;
  }

  @action
  void setLoading(bool loading) {
    isLoading = loading;
  }

  @action
  void resetState() {
    selectedIndex = 0;
    isLoading = false;
    errorMessage = null;
    navigationHistory.clear();
  }

  // Lifecycle
  void initialize() {
    resetState();
  }

  void dispose() {
    navigationHistory.clear();
  }

  // Helper Methods
  bool isScreenValid(int index) {
    return index >= 0 && index < screens.length;
  }

  String getScreenTitle(int index) {
    return isScreenValid(index) ? screenTitles[index] : '';
  }

  IconData getScreenIcon(int index) {
    return isScreenValid(index) ? screenIcons[index] : Icons.error;
  }
}