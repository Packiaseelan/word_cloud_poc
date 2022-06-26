part of '../coordinator/add_question_coordinator.dart';

class AddQuestionState {
  final String questionText;
  final String? message;

  AddQuestionState({
    required this.questionText,
    this.message,
  });

  AddQuestionState copyWith({
    String? questionText,
    String? message,
  }) =>
      AddQuestionState(
        questionText: questionText ?? this.questionText,
        message: message ?? this.message,
      );
}
