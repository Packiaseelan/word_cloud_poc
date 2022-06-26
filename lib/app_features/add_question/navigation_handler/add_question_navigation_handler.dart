part of '../coordinator/add_question_coordinator.dart';

abstract class IAddQuestionNavigationHandler {
  void goBack();
}

class AddQuestionNavigationHandler extends IAddQuestionNavigationHandler {
  @override
  void goBack() {
    NavigationManager.goBack();
  }
}
