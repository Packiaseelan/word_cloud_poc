import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/models/answer_model.dart';
import 'package:word_cloud_poc/models/question_model.dart';
import 'package:word_cloud_poc/models/scatter_model.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

part '../state/answer_board_state.dart';
part '../navigation_handler/answer_board_navigation_handler.dart';
part '../view_model/answer_board_view_model.dart';

class AnswerBoardCoordinator extends BaseCoordinator<AnswerBoardState> {
  final IAnswerBoardNavigationHandler _navigationHandler;
  final FirebaseDatabaseService _fbDbService;
  final AnswerBoardViewModel _viewModel;
  AnswerBoardCoordinator(
    this._navigationHandler,
    this._viewModel,
    this._fbDbService,
  ) : super(AnswerBoardState());

  void initialize(Map<String, dynamic> args) {
    if (args['question'] != null) {
      state = state.copyWith(question: args['question'] as QuestionModel);
    }
    _getAnswers();
  }

  void _getAnswers() {
    _fbDbService.getAnswersFor(state.question?.questionId ?? "", _onUpdate);
  }

  void _onUpdate(List<AnswerModel> answers) {
    final scatters = _viewModel.process(answers);
    state = state.copyWith(
      answers: answers,
      scatters: scatters,
    );
  }

  String? onAnswerValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a valid answer.';
    }
    return null;
  }

  void onAnswerSave(String? value) {
    state = state.copyWith(answer: value);
  }

  void onSubmitAnswer() {
    var answer = AnswerModel(questionId: state.question?.questionId, answerText: state.answer);
    _fbDbService.saveAnswer(answer);
    state = state.copyWith(answer: "");
    // _navigationHandler.goBack();
  }
}
