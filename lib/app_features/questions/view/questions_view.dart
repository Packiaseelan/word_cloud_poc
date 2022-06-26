import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/questions/coordinator/questions_coordinator.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<QuestionsCoordinator, QuestionsState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, QuestionsState state, QuestionsCoordinator coordinator) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
        actions: [
          IconButton(
            onPressed: () => coordinator.navigateToAddQuestion(),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, QuestionsState state) {
    if (state.questions.isEmpty) {
      return _buildEmptyBody(context);
    }
    return _buildList(state);
  }

  Widget _buildList(QuestionsState state) {
    return ListView.builder(
      itemCount: state.questions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(state.questions[index].questionText ?? ""),
          subtitle: const Text("Hosted by you"),
        );
      },
    );
  }

  Widget _buildEmptyBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          'You dont\'t have any questions yet, please click the "+" button on the top right to add new question.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
