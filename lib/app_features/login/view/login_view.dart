import 'package:flutter/material.dart';
import 'package:word_cloud_poc/components/widgets/app_button.dart';
import 'package:word_cloud_poc/components/widgets/app_text_field.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';
import 'package:word_cloud_poc/app_features/login/coordinator/login_coordinator.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginCoordinator, LoginState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, LoginState state, LoginCoordinator coordinator) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFormTextField(
                hint: 'EMAIL',
                keyboardType: TextInputType.emailAddress,
                validator: coordinator.onEmailValidator,
                onSaved: coordinator.onEmailSave,
              ),
              AppFormTextField(
                hint: 'PASSWORD',
                validator: coordinator.onPasswordValidator,
                onSaved: coordinator.onPasswordSave,
              ),
              Text(state.message ?? ""),
              const SizedBox(height: 15),
              AppButton(
                title: 'Login',
                onPressed: () => _trySubmit(context, coordinator),
              ),
              const SizedBox(height: 15),
              AppButton(
                title: 'Create new account',
                isTransparentBg: true,
                onPressed: () => coordinator.navigateToRegister(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _trySubmit(BuildContext context, LoginCoordinator coordinator) {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      coordinator.doLogin();
    }
  }
}
