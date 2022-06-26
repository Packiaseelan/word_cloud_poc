import 'package:word_cloud_poc/app_features/add_question/coordinator/add_question_coordinator.dart';
import 'package:word_cloud_poc/app_features/answer_board/coordinator/answer_board_coordinator.dart';
import 'package:word_cloud_poc/app_features/home/coordinator/home_coordinator.dart';
import 'package:word_cloud_poc/app_features/login/coordinator/login_coordinator.dart';
import 'package:word_cloud_poc/app_features/profile/coordinator/profile_coordinator.dart';
import 'package:word_cloud_poc/app_features/questions/coordinator/questions_coordinator.dart';
import 'package:word_cloud_poc/app_features/register/coordinator/register_coordinator.dart';
import 'package:word_cloud_poc/app_features/splash/coordinator/splash_coordinator.dart';
import 'package:word_cloud_poc/core/ioc/di_container.dart';
import 'package:word_cloud_poc/service/firebase_database_service.dart';

class GlobalModule {
  static void registerDependencies() {
    DIContainer.container.registerFactory(
      (container) => FirebaseDatabaseService(),
    );

    DIContainer.container.registerFactory(
      (container) => SplashCoordinator(
        SplashNavigationHandler(),
        SplashViewModel(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => LoginCoordinator(
        LoginNavigationHandler(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => RegisterCoordinator(
        RegisterNavigationHandler(),
        container.resolve<FirebaseDatabaseService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => HomeCoordinator(
        HomeNavigationHandler(),
        HomeViewModel(),
        container.resolve<FirebaseDatabaseService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => QuestionsCoordinator(
        QuestionsNavigationHandler(),
        container.resolve<FirebaseDatabaseService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => AddQuestionCoordinator(
        AddQuestionNavigationHandler(),
        container.resolve<FirebaseDatabaseService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => ProfileCoordinator(
        ProfileNavigationHandler(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => AnswerBoardCoordinator(
        AnswerBoardNavigationHandler(),
        AnswerBoardViewModel(),
        container.resolve<FirebaseDatabaseService>(),
      ),
    );
  }
}
