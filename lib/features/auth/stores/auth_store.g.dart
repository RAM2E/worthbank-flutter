// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??=
          Computed<bool>(() => super.isLoggedIn, name: '_AuthStore.isLoggedIn'))
      .value;
  Computed<bool>? _$isAdminComputed;

  @override
  bool get isAdmin => (_$isAdminComputed ??=
          Computed<bool>(() => super.isAdmin, name: '_AuthStore.isAdmin'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_AuthStore.isLoading', context: context);

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
      Atom(name: '_AuthStore.errorMessage', context: context);

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

  late final _$emailErrorAtom =
      Atom(name: '_AuthStore.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_AuthStore.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$accountIdErrorAtom =
      Atom(name: '_AuthStore.accountIdError', context: context);

  @override
  String? get accountIdError {
    _$accountIdErrorAtom.reportRead();
    return super.accountIdError;
  }

  @override
  set accountIdError(String? value) {
    _$accountIdErrorAtom.reportWrite(value, super.accountIdError, () {
      super.accountIdError = value;
    });
  }

  late final _$tokenAtom = Atom(name: '_AuthStore.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$userRoleAtom =
      Atom(name: '_AuthStore.userRole', context: context);

  @override
  String? get userRole {
    _$userRoleAtom.reportRead();
    return super.userRole;
  }

  @override
  set userRole(String? value) {
    _$userRoleAtom.reportWrite(value, super.userRole, () {
      super.userRole = value;
    });
  }

  late final _$customerLoginAsyncAction =
      AsyncAction('_AuthStore.customerLogin', context: context);

  @override
  Future<bool> customerLogin(String accountId, String password) {
    return _$customerLoginAsyncAction
        .run(() => super.customerLogin(accountId, password));
  }

  late final _$adminLoginAsyncAction =
      AsyncAction('_AuthStore.adminLogin', context: context);

  @override
  Future<bool> adminLogin(String email, String password) {
    return _$adminLoginAsyncAction.run(() => super.adminLogin(email, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void clearErrors() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.clearErrors');
    try {
      return super.clearErrors();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
emailError: ${emailError},
passwordError: ${passwordError},
accountIdError: ${accountIdError},
token: ${token},
userRole: ${userRole},
isLoggedIn: ${isLoggedIn},
isAdmin: ${isAdmin}
    ''';
  }
}
