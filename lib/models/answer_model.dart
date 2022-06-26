class AnswerModel {
  String? answerId;
  String? questionId;
  String? answerText;
  String? userId;

  AnswerModel({
    required this.questionId,
    required this.answerText,
    this.answerId,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'answerId': answerId,
      'questionId': questionId,
      'questionText': answerText,
      'userId': userId,
    };
  }

  AnswerModel.fromJson(Map<dynamic, dynamic> json) {
    answerId = json['answerId'];
    questionId = json['questionId'];
    answerText = json['questionText'];
    userId = json['userId'];
  }
}
