part of '../coordinator/splash_coordinator.dart';

class SplashViewModel {
  final _auth = FirebaseAuth.instance;

  bool isAuthenticated() {
    return _auth.currentUser != null;
  }
}
