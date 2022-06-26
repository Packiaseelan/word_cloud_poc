import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/answer_board/coordinator/answer_board_coordinator.dart';
import 'package:word_cloud_poc/app_features/answer_board/view/board_view.dart';
import 'package:word_cloud_poc/components/widgets/app_button.dart';
import 'package:word_cloud_poc/components/widgets/app_text_field.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';
import 'package:word_cloud_poc/models/question_model.dart';

class AnswerBoardView extends StatelessWidget {
  final Map<String, dynamic> args;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController answerTextController = TextEditingController();

  AnswerBoardView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AnswerBoardCoordinator, AnswerBoardState>(
      setupCoordinator: (coordinator) => coordinator.initialize(args),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AnswerBoardState state, AnswerBoardCoordinator coordinator) {
    _updateController(state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Board'),
      ),
      body: _buildBody(context, state, coordinator),
    );
  }

  Widget _buildBody(BuildContext context, AnswerBoardState state, AnswerBoardCoordinator coordinator) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.question != null) _buildQuestion(state.question!),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BoardView(scaterModel: state.scatters),
              ),
              AppFormTextField(
                controller: answerTextController,
                hint: 'Enter your response.',
                validator: coordinator.onAnswerValidator,
                onSaved: coordinator.onAnswerSave,
              ),
              const SizedBox(height: 15),
              AppButton(
                title: 'Submit',
                onPressed: () => _trySubmit(context, coordinator),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateController(AnswerBoardState state) {
    answerTextController.text = state.answer ?? "";
  }

  Widget _buildQuestion(QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(question.questionText ?? ""), Text(question.userEmail ?? "")],
    );
  }

  void _trySubmit(BuildContext context, AnswerBoardCoordinator coordinator) {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      coordinator.onSubmitAnswer();
    }
  }
}
