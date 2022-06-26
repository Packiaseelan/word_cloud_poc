import 'package:flutter/material.dart';

class ScatterModel {
  final String title;
  final Color color;
  final int size;
  final bool rorate;

  ScatterModel({
    required this.title,
    required this.color,
    this.size = 15,
    this.rorate = false,
  });
}

class WordCloudTemplateModel {
  final String templateId;
  final int bgColor;
  final List<int> fontSizes;
  final List<int> fontColors;
  final String? fontFamily;

  WordCloudTemplateModel({
    required this.templateId,
    required this.bgColor,
    this.fontSizes = const [],
    this.fontColors = const [],
    this.fontFamily,
  });
}
