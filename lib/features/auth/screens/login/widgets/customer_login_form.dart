import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../shared/components/inputs/custom_textfield.dart';
import '../../../../../shared/components/buttons/custom_button.dart';
import '../../../stores/auth_store.dart';
import '../../../utils/auth_responsive.dart';

class CustomerLoginForm extends StatelessWidget {
  final AuthStore authStore;
  final VoidCallback? onLoginSuccess;

  const CustomerLoginForm({
    Key? key,
    required this.authStore,
    this.onLoginSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Padding(
          padding: AuthResponsive.getPadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Account ID',
                controller: authStore.accountIdController,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.account_circle,
                errorText: authStore.accountIdError,
              ),
              SizedBox(height: AuthResponsive.getSpacing(context)),
              CustomTextField(
                label: 'Password',
                controller: authStore.passwordController,
                isPassword: true,
                prefixIcon: Icons.lock,
                errorText: authStore.passwordError,
              ),
              SizedBox(height: AuthResponsive.getSpacing(context)),
              _buildForgotPassword(context),
              SizedBox(height: AuthResponsive.getSpacing(context)),
              CustomButton(
                text: 'Login as Customer',
                onPressed: () => _handleLogin(context),
                width: AuthResponsive.getFieldWidth(context),
                height: AuthResponsive.getButtonHeight(context),
                isLoading: authStore.isLoading,
              ),
              if (authStore.errorMessage != null)
                Padding(
                  padding: EdgeInsets.only(
                    top: AuthResponsive.getSpacing(context),
                  ),
                  child: Text(
                    authStore.errorMessage!,
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: AuthResponsive.getBodySize(context),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Container(
      width: AuthResponsive.getFieldWidth(context),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: AuthResponsive.getBodySize(context),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (await authStore.customerLogin(
      authStore.accountIdController.text,
      authStore.passwordController.text,
    )) {
      onLoginSuccess?.call();
    }
  }
}