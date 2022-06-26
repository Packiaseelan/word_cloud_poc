import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:word_cloud_poc/config/app_theme.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';

class WordCloudPocApp extends StatelessWidget {
  final String appTitle;
  final Widget homeWidget;

  const WordCloudPocApp({
    Key? key,
    required this.appTitle,
    required this.homeWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: AppTheme.of(context),
      home: homeWidget,
      onGenerateRoute: NavigationManager.getRoute,
    );
  }
}
