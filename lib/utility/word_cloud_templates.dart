import 'package:word_cloud_poc/models/scatter_model.dart';

class WordCloudTemplate {
  
  List<WordCloudTemplateModel> templates = [];

  WordCloudTemplate() {
    _init();
  }

  void _init() {
    templates = [
      WordCloudTemplateModel(
        templateId: 'template1',
        bgColor: 0xFFFFFFFF,
        fontColors: [0xFFFFC108, 0xFF13B9FD, 0xFFA10035, 0xFF2C3639, 0xFF4C3A51, 0xFFF94C66],
        fontSizes: []
      ),
    ];
  }
}
