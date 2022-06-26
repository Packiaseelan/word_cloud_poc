import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/add_question/coordinator/add_question_coordinator.dart';
import 'package:word_cloud_poc/components/widgets/app_button.dart';
import 'package:word_cloud_poc/components/widgets/app_text_field.dart';
import 'package:word_cloud_poc/core/base_view/base_view.dart';

class AddQuestionView extends StatelessWidget {
  AddQuestionView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AddQuestionCoordinator, AddQuestionState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AddQuestionState state, AddQuestionCoordinator coordinator) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppFormTextField(
                hint: 'Question Text',
                validator: coordinator.onTextValidator,
                onSaved: coordinator.onTextSave,
              ),
              const Spacer(),
              AppButton(
                title: 'Save',
                onPressed: () => _trySubmit(context, coordinator),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _trySubmit(BuildContext context, AddQuestionCoordinator coordinator) {
    final isValid = _formKey.currentState?.validate() ?? false;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      coordinator.onSave();
    }
  }
}
