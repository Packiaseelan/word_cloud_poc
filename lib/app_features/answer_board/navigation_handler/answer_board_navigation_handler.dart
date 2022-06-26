part of '../coordinator/answer_board_coordinator.dart';

abstract class IAnswerBoardNavigationHandler {
  void goBack();
}

class AnswerBoardNavigationHandler extends IAnswerBoardNavigationHandler {
  @override
  void goBack() {
    NavigationManager.goBack();
  }
}