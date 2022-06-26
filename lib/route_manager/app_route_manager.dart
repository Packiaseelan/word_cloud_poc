import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/add_question/view/add_question_view.dart';
import 'package:word_cloud_poc/app_features/answer_board/view/answer_board_view.dart';
import 'package:word_cloud_poc/app_features/landing/landing_view.dart';
import 'package:word_cloud_poc/app_features/login/view/login_view.dart';
import 'package:word_cloud_poc/app_features/register/view/register_view.dart';
import 'package:word_cloud_poc/core/navigation/i_route_manager.dart';

class AppRouteManager extends IRouteManager {
  static const landing = 'landing';
  static const login = 'login';
  static const register = 'register';
  static const addQuestion = 'addQuestion';
  static const answerBoard = 'answerBoard';

  @override
  Widget getView(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case login:
        return LoginView(
          key: const Key('AppRouteManager_LoginView'),
        );

      case register:
        return RegisterView(
          key: const Key('AppRouteManager_RegisterView'),
        );

      case landing:
        return const LandingView(
          key: Key('AppRouteManager_LandingView'),
        );

      case addQuestion:
        return AddQuestionView(
          key: const Key('AppRouteManager_AddQuestionView'),
        );

      case answerBoard:
        return AnswerBoardView(
          key: const Key('AppRouteManager_AnswerBoardView'),
          args: args,
        );

      default:
        return super.getView(settings);
    }
  }

  @override
  Widget getDialog(String dialogName, arguments) {
    switch (dialogName) {
      default:
        return super.getDialog(dialogName, arguments);
    }
  }

  @override
  Widget getBottomSheet(String bottomSheetName, arguments) {
    switch (bottomSheetName) {
      default:
        return super.getBottomSheet(bottomSheetName, arguments);
    }
  }
}
