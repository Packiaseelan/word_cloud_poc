import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';

part '../navigation_handler/splash_navigation_handler.dart';
part '../state/splash_state.dart';
part '../view_model/splash_view_model.dart';

class SplashCoordinator extends BaseCoordinator<SplashState> {
  final ISplashNavigationHandler _navigationHandler;
  final SplashViewModel _viewModel;

  SplashCoordinator(
    this._navigationHandler,
    this._viewModel,
  ) : super(SplashState());

  void initialize() {
    Timer(const Duration(seconds: 1), () {
      if (_viewModel.isAuthenticated()) {
        _navigationHandler.navigateToHome();
      } else {
        _navigationHandler.navigateToLogin();
      }
    });
  }
}
