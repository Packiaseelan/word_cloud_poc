import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';

part '../state/profile_state.dart';
part '../navigation_handler/profile_navigation_handler.dart';

class ProfileCoordinator extends BaseCoordinator<ProfileState> {
  final IProfileNavigationHandler _navigationHandler;
  final _auth = FirebaseAuth.instance;
  ProfileCoordinator(this._navigationHandler) : super(ProfileState());

  void initialize() {}

  void onLogout() {
    _auth.signOut();
    _navigationHandler.navigateToLogin();
  }
}
