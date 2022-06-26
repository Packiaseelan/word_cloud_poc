import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/register/coordinator/register_coordinator.dart';
import 'package:word_cloud_poc/components/widgets/app_button.dart';
import 'package:word_cloud_poc/components/widgets/app_text_field.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterCoordinator, RegisterState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, RegisterState state, RegisterCoordinator coordinator) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFormTextField(
                hint: 'USER NAME',
                validator: coordinator.onUserNameValidator,
                onSaved: coordinator.onUserNameSave,
              ),
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
              const SizedBox(height: 15),
              AppButton(
                title: 'Register',
                onPressed: () => _trySubmit(context, coordinator),
              ),
              const SizedBox(height: 15),
              AppButton(
                title: 'I already have an account',
                isTransparentBg: true,
                onPressed: () => coordinator.navigateToLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _trySubmit(BuildContext context, RegisterCoordinator coordinator) {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      coordinator.doRegister();
    }
  }
}
