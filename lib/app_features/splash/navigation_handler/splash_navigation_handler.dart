part of '../coordinator/splash_coordinator.dart';

abstract class ISplashNavigationHandler {
  void navigateToHome();
  void navigateToLogin();
}

class SplashNavigationHandler extends ISplashNavigationHandler {
  @override
  void navigateToHome() {
    NavigationManager.navigateTo('app-landing', NavigationType.Replace);
  }
  
  @override
  void navigateToLogin() {
    NavigationManager.navigateTo('app-login', NavigationType.Replace);
  }
}
