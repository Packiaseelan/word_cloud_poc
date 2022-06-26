part of '../coordinator/profile_coordinator.dart';

abstract class IProfileNavigationHandler {
  void navigateToLogin();
}

class ProfileNavigationHandler extends IProfileNavigationHandler {
  @override
  void navigateToLogin() {
    NavigationManager.navigateTo('app-login', NavigationType.Replace);
  }
}