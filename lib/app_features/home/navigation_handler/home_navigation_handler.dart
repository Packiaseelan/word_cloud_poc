part of '../coordinator/home_coordinator.dart';

abstract class IHomeNavigationHandler {
  void navigateToAnswer(QuestionModel question);
}

class HomeNavigationHandler extends IHomeNavigationHandler {
  @override
  void navigateToAnswer(QuestionModel question) {
    NavigationManager.navigateTo(
      'app-answerBoard',
      NavigationType.Push,
      arguments: {'question': question},
    );
  }
}
