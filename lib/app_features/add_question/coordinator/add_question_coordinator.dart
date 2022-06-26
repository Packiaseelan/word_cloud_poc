import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/models/question_model.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

part '../state/add_question_state.dart';
part '../navigation_handler/add_question_navigation_handler.dart';

class AddQuestionCoordinator extends BaseCoordinator<AddQuestionState> {
  final IAddQuestionNavigationHandler _navigationHandler;
  final FirebaseDatabaseService _fbDbService;
  AddQuestionCoordinator(
    this._navigationHandler,
    this._fbDbService,
  ) : super(
          AddQuestionState(
            questionText: "",
          ),
        );

  void initialize() {}

  String? onTextValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a valid question';
    }
    return null;
  }

  void onTextSave(String? value) {
    state = state.copyWith(questionText: value);
  }

  void onSave() {
    if (state.questionText.isNotEmpty) {
      var question = QuestionModel(questionText: state.questionText);
      _fbDbService.saveQuestion(question);
      _navigationHandler.goBack();
    }
  }
}
