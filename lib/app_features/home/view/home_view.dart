import 'package:flutter/material.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';
import 'package:word_cloud_poc/app_features/home/coordinator/home_coordinator.dart';
import 'package:word_cloud_poc/models/question_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeCoordinator, HomeState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    HomeState state,
    HomeCoordinator coordinator,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Cloud'),
      ),
      body: _buildBody(context, state, coordinator),
    );
  }

  Widget _buildBody(
    BuildContext context,
    HomeState state,
    HomeCoordinator coordinator,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.questions.isEmpty) {
      return _buildEmptyBody(context);
    }
    return _buildList(state, coordinator);
  }

  Widget _buildList(
    HomeState state,
    HomeCoordinator coordinator,
  ) {
    return ListView.builder(
      itemCount: state.questions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(state.questions[index].questionText ?? ""),
          subtitle: _buildHosted(state, state.questions[index]),
          onTap: () => coordinator.navigateToAnswer(state.questions[index]),
        );
      },
    );
  }

  Widget _buildHosted(HomeState state, QuestionModel question) {
    return Row(
      children: [const Text('Hosted by:'), Text(question.userEmail == state.email ? 'You' : question.userEmail ?? "")],
    );
  }

  Widget _buildEmptyBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          'No questions added, please go to Questions tab and click the "+" button on the top right to add new question.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
