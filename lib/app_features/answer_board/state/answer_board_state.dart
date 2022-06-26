part of '../coordinator/answer_board_coordinator.dart';

class AnswerBoardState {
  final QuestionModel? question;
  final String? answer;
  final List<AnswerModel> answers;
  final List<ScatterModel> scatters;

  AnswerBoardState({
    this.question,
    this.answer,
    this.answers = const [],
    this.scatters = const [],
  });

  AnswerBoardState copyWith({
    QuestionModel? question,
    String? answer,
    List<AnswerModel>? answers,
    List<ScatterModel>? scatters,
  }) =>
      AnswerBoardState(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        answers: answers ?? this.answers,
        scatters: scatters ?? this.scatters,
      );
}
