import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../stores/auth_store.dart';
import '../../../utils/auth_responsive.dart';
import '../../../../../shared/components/inputs/custom_textfield.dart';
import '../../../../../shared/components/buttons/custom_button.dart';

class AdminLoginForm extends StatelessWidget {
  final AuthStore authStore;
  final VoidCallback? onLoginSuccess;
  
  const AdminLoginForm({
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
                label: 'Email',
                controller: authStore.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                errorText: authStore.emailError,
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
                text: 'Login as Admin',
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
                      color: Colors.red,
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
            color: Colors.white,
            fontSize: AuthResponsive.getBodySize(context),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (await authStore.adminLogin(
      authStore.emailController.text,
      authStore.passwordController.text,
    )) {
      onLoginSuccess?.call();
    }
  }
}