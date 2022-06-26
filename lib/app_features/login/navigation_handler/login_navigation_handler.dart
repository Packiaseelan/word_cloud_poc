part of '../coordinator/login_coordinator.dart';

abstract class ILoginNavigationHandler {
  void navigateToReister();
  void navigateToHome();
}

class LoginNavigationHandler extends ILoginNavigationHandler {
  @override
  void navigateToReister() {
    NavigationManager.navigateTo('app-register', NavigationType.Replace);
  }
  
  @override
  void navigateToHome() {
    NavigationManager.navigateTo('app-landing', NavigationType.Replace);
  }
}
