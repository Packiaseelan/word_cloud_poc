import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';
import 'package:word_cloud_poc/models/question_model.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

part '../state/questions_state.dart';
part '../navigation_handler/questions_navigation_handler.dart';

class QuestionsCoordinator extends BaseCoordinator<QuestionsState> {
  final IQuestionsNavigationHandler _navigationHandler;
  final FirebaseDatabaseService _fbDbService;

  QuestionsCoordinator(
    this._navigationHandler,
    this._fbDbService,
  ) : super(QuestionsState());

  void initialize() {
    getQuestions();
  }

  void getQuestions() async {
    state = state.copyWith(isLoading: true);
    await _fbDbService.getQuestionsFor(_onUpdate);
  }

  void _onUpdate(List<QuestionModel> questions) {
    state = state.copyWith(questions: questions, isLoading: false);
  }

  void navigateToAddQuestion() => _navigationHandler.navigateToAddQuestion();
}
