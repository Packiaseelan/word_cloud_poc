import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/profile/coordinator/profile_coordinator.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileCoordinator, ProfileState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, ProfileState state, ProfileCoordinator coordinator) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => coordinator.onLogout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
