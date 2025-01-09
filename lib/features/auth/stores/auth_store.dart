import 'package:banking_app_frontend/shared/services/auth_service.dart';
import 'package:banking_app_frontend/shared/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final accountIdController = TextEditingController();

  // Observables
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @observable
  String? accountIdError;

  @observable
  String? token;

  @observable
  String? userRole;

  // Computed Values
  @computed
  bool get isLoggedIn => token != null && token!.isNotEmpty;

  @computed
  bool get isAdmin => userRole == 'ADMIN';

  // Actions
  @action
  Future<bool> customerLogin(String accountId, String password) async {
    if (!_validateCustomerLogin(accountId, password)) return false;

    isLoading = true;
    clearErrors();

    try {
      final response = await AuthService.customerLogin(accountId, password);
      if (response['status'] == 'success') {
        token = response['token'];
        userRole = 'CUSTOMER';
        await SharedPrefs.saveToken(token!);
        await SharedPrefs.saveUserRole(userRole!);
        await SharedPrefs.saveAccountId(accountId);
        return true;
      }
      errorMessage = response['message'] ?? 'Login failed';
      return false;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> adminLogin(String email, String password) async {
    if (!_validateAdminLogin(email, password)) return false;

    isLoading = true;
    clearErrors();

    try {
      final response = await AuthService.adminLogin(email, password);
      if (response['status'] == 'success') {
        token = response['token'];
        userRole = 'ADMIN';
        await SharedPrefs.saveToken(token!);
        await SharedPrefs.saveUserRole(userRole!);
        await SharedPrefs.saveUserEmail(email);
        return true;
      }
      errorMessage = response['message'] ?? 'Login failed';
      return false;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }

  // Validation Methods
  bool _validateCustomerLogin(String accountId, String password) {
    clearErrors();
    
    if (accountId.isEmpty) {
      accountIdError = 'Account ID is required';
      errorMessage = accountIdError;
      return false;
    }
    if (password.isEmpty) {
      passwordError = 'Password is required';
      errorMessage = passwordError;
      return false;
    }
    return true;
  }

  bool _validateAdminLogin(String email, String password) {
    clearErrors();
    
    if (email.isEmpty) {
      emailError = 'Email is required';
      errorMessage = emailError;
      return false;
    }
    if (!email.contains('@')) {
      emailError = 'Invalid email format';
      errorMessage = emailError;
      return false;
    }
    if (password.isEmpty) {
      passwordError = 'Password is required';
      errorMessage = passwordError;
      return false;
    }
    return true;
  }

  // Helper Methods
  @action
  void clearErrors() {
    errorMessage = null;
    emailError = null;
    passwordError = null;
    accountIdError = null;
  }

  @action
  Future<void> logout() async {
    token = null;
    userRole = null;
    await SharedPrefs.clearAll();
    clearControllers();
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    accountIdController.clear();
    clearErrors();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    accountIdController.dispose();
  }
}