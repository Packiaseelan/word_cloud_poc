part of '../coordinator/login_coordinator.dart';

class LoginState {
  final String? email;
  final String? password;
  final String? message;
  final bool isLoading;

  bool get isLoginEnable {
    return email != null && email!.isNotEmpty && password != null && password!.isNotEmpty;
  }

  LoginState({
    this.email,
    this.password,
    this.message,
    this.isLoading = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    bool? isLoading,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
      );
}
