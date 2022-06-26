part of '../coordinator/home_coordinator.dart';

class HomeState {
  final List<QuestionModel> questions;
  final String? email;
  final bool isLoading;

  HomeState({
    this.questions = const [],
    this.email,
    this.isLoading = false,
  });

  HomeState copyWith({
    List<QuestionModel>? questions,
    String? email,
    bool? isLoading,
  }) =>
      HomeState(
        questions: questions ?? this.questions,
        email: email ?? this.email,
        isLoading: isLoading ?? this.isLoading,
      );
}
