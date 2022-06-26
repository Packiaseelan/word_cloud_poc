import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_cloud_poc/app.dart';
import 'package:word_cloud_poc/core/navigation/i_navigation_handler.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/global_module_initializer.dart';
import 'package:word_cloud_poc/route_manager/app_route_manager.dart';

Future<Widget> _initialSetup(String appTitle, Widget homeWidget) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _registerDependencies();
  _registerNavigation();
  return WordCloudPocApp(
    appTitle: appTitle,
    homeWidget: homeWidget,
  );
}

void runTheApp(String appTitle, Widget homeWidget) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      var app = await _initialSetup(appTitle, homeWidget);
      runApp(ProviderScope(child: app));
    },
    (error, stackTrace) {},
  );
}

void _registerNavigation() {
  NavigationManager.registerRouteManager('app', AppRouteManager());
}

void _registerDependencies() {
  NavigationManager(DefaultNavigationHandler());
  GlobalModule.registerDependencies();
}
