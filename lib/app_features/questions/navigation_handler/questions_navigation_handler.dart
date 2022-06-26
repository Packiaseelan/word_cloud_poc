part of '../coordinator/questions_coordinator.dart';

abstract class IQuestionsNavigationHandler {
  void navigateToAddQuestion();
}

class QuestionsNavigationHandler extends IQuestionsNavigationHandler {
  @override
  void navigateToAddQuestion() {
    NavigationManager.navigateTo('app-addQuestion', NavigationType.Push);
  }
}