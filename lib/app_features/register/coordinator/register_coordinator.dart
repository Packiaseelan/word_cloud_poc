import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_cloud_poc/models/user_model.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

part '../state/register_state.dart';
part '../navigation_handler/register_navigation_handler.dart';

class RegisterCoordinator extends BaseCoordinator<RegisterState> {
  final IRegisterNavigationHandler _navigationHandler;
  final FirebaseDatabaseService _fbDbService;
  final _auth = FirebaseAuth.instance;

  RegisterCoordinator(
    this._navigationHandler,
    this._fbDbService,
  ) : super(RegisterState());

  void initialize() {}

  void navigateToLogin() => _navigationHandler.navigateToLogin();

  String? onEmailValidator(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? onUserNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? onPasswordValidator(String? value) {
    if (value!.isEmpty || value.length < 7) {
      return 'Please enter a long password';
    }
    return null;
  }

  void onUserNameSave(String? value) {
    state = state.copyWith(userName: value);
  }

  void onEmailSave(String? value) {
    state = state.copyWith(email: value);
  }

  void onPasswordSave(String? value) {
    state = state.copyWith(password: value);
  }

  Future<void> doRegister() async {
    state = state.copyWith(isLoading: true);
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(email: state.email!, password: state.password!);
      final user = UserModel(userId: userCredential.user?.uid, userName: state.userName, emailId: state.email);
      _fbDbService.saveUser(user);
      state = state.copyWith(isLoading: false);
      _navigationHandler.navigateToHome();
    } catch (error) {
      state = state.copyWith(isLoading: false);
    }
  }
}
