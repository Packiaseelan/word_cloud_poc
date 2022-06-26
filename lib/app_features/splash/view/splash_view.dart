import 'package:flutter/material.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';
import 'package:word_cloud_poc/app_features/splash/coordinator/splash_coordinator.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashCoordinator, SplashState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    SplashState state,
    SplashCoordinator coordinator,
  ) {
    return const Scaffold();
  }
}
