part of '../coordinator/questions_coordinator.dart';

class QuestionsState {
  final List<QuestionModel> questions;
  final bool isLoading;

  QuestionsState({
    this.questions = const [],
    this.isLoading = false,
  });

  QuestionsState copyWith({
    List<QuestionModel>? questions,
    bool? isLoading,
  }) =>
      QuestionsState(
        questions: questions ?? this.questions,
        isLoading: isLoading ?? this.isLoading,
      );
}
