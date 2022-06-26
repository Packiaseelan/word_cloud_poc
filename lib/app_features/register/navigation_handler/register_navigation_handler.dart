part of '../coordinator/register_coordinator.dart';

abstract class IRegisterNavigationHandler {
  void navigateToLogin();
  void navigateToHome();
}

class RegisterNavigationHandler extends IRegisterNavigationHandler {
  @override
  void navigateToLogin() {
    NavigationManager.navigateTo('app-login', NavigationType.Replace);
  }

  @override
  void navigateToHome() {
    NavigationManager.navigateTo('app-landing', NavigationType.Replace);
  }
}
