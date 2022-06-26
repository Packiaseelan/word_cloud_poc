import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_cloud_poc/core/base_coordinator/base_coordinator.dart';
import 'package:word_cloud_poc/core/navigation/navigation_manager.dart';
import 'package:word_cloud_poc/core/navigation/navigation_type.dart';
import 'package:word_cloud_poc/models/question_model.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

part '../state/home_state.dart';
part '../view_model/home_view_model.dart';
part '../navigation_handler/home_navigation_handler.dart';

class HomeCoordinator extends BaseCoordinator<HomeState> {
  final IHomeNavigationHandler _navigationHandler;
  final FirebaseDatabaseService _fbDbService;
  final HomeViewModel _viewModel;
  final _auth = FirebaseAuth.instance;

  HomeCoordinator(
    this._navigationHandler,
    this._viewModel,
    this._fbDbService,
  ) : super(HomeState());

  void initialize() {
    state = state.copyWith(email: _auth.currentUser?.email);
    _getQuestions();
  }

  void _getQuestions() async {
    state = state.copyWith(isLoading: true);
    await _fbDbService.getQuestions(_onUpdate);
  }

  void _onUpdate(List<QuestionModel> questions) {
    state = state.copyWith(questions: questions, isLoading: false);
  }

  void navigateToAnswer(QuestionModel question) => _navigationHandler.navigateToAnswer(question);
}
