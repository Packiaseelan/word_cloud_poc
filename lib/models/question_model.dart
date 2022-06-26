class QuestionModel {
  String? questionId;
  String? questionText;
  String? userId;
  String? userEmail;
  bool? isCompleted;

  QuestionModel({
    this.questionId,
    required this.questionText,
    this.userId,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'questionText': questionText,
      'userId': userId,
      'userEmail': userEmail,
      'isCompleted': isCompleted,
    };
  }

  QuestionModel.fromJson(Map<dynamic, dynamic> json) {
    questionId = json['questionId'];
    questionText = json['questionText'];
    userId = json['userId'];
    userEmail = json['userEmail'];
    isCompleted = json['isCompleted'];
  }
}
