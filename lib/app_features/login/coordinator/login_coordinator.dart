import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';

part '../state/login_state.dart';
part '../navigation_handler/login_navigation_handler.dart';

class LoginCoordinator extends BaseCoordinator<LoginState> {
  final ILoginNavigationHandler _navigationHandler;
  final _auth = FirebaseAuth.instance;

  LoginCoordinator(this._navigationHandler) : super(LoginState());

  void initialize() {}

  void navigateToRegister() => _navigationHandler.navigateToReister();

  String? onEmailValidator(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? onPasswordValidator(String? value) {
    if (value!.isEmpty || value.length < 7) {
      return 'Please enter a long password';
    }
    return null;
  }

  void onEmailSave(String? value) {
    state = state.copyWith(email: value);
  }

  void onPasswordSave(String? value) {
    state = state.copyWith(password: value);
  }

  Future<void> doLogin() async {
    state = state.copyWith(isLoading: true);

    try {
      await _auth.signInWithEmailAndPassword(email: state.email!, password: state.password!);
      state = state.copyWith(isLoading: false);
      _navigationHandler.navigateToHome();
    } catch (error) {
      if (error is FirebaseAuthException) {
        state = state.copyWith(isLoading: false, message: "${error.message}");
      } else {
        state = state.copyWith(isLoading: false, message: "$error");
      }
    }
  }
}
