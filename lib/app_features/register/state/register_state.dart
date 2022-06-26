part of '../coordinator/register_coordinator.dart';

class RegisterState {
  final String? userName;
  final String? email;
  final String? password;
  final String? message;
  final bool isLoading;

  RegisterState({
    this.userName,
    this.email,
    this.password,
    this.message,
    this.isLoading = false,
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? message,
    bool? isLoading,
  }) =>
      RegisterState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
      );
}
