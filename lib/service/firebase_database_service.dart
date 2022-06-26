import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:word_cloud_poc/models/answer_model.dart';
import 'package:word_cloud_poc/models/question_model.dart';
import 'package:word_cloud_poc/models/user_model.dart';

class FirebaseDatabaseService {
  final databaseReference = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;

  Future saveUser(UserModel user) async {
    var id = databaseReference.child('users/').push();
    id.set(user.toJson());
  }

  Future<List<UserModel>> getUsers() async {
    var databaseEvent = await databaseReference.child('users/').once();
    DataSnapshot dataSnapshot = databaseEvent.snapshot;
    var users = <UserModel>[];
    if (dataSnapshot.value != null) {
      final keyVal = dataSnapshot.value as Map<dynamic, dynamic>;
      keyVal.forEach((k, v) {
        users.add(UserModel.fromJson(v));
      });
    }
    return users;
  }

  Future<UserModel> getUserBy(String userId) async {
    var databaseEvent = await databaseReference.child('users/').orderByChild('userId').equalTo(userId).once();
    DataSnapshot dataSnapshot = databaseEvent.snapshot;
    var users = <UserModel>[];
    if (dataSnapshot.value != null) {
      final keyVal = dataSnapshot.value as Map<dynamic, dynamic>;
      keyVal.forEach((k, v) {
        users.add(UserModel.fromJson(v));
      });
    }
    return users.first;
  }

  Future saveQuestion(QuestionModel question) async {
    final userId = _auth.currentUser?.uid;
    final userEmail = _auth.currentUser?.email;
    var id = databaseReference.child('questions/').push();
    question.questionId = id.key;
    question.userId = userId;
    question.userEmail = userEmail;
    id.set(question.toJson());
  }

  Future<void> getQuestions(Function(List<QuestionModel>) onUpdate) async {
    databaseReference.child('questions/').onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      var questions = <QuestionModel>[];
      if (dataSnapshot.value != null) {
        final keyVal = dataSnapshot.value as Map<dynamic, dynamic>;
        keyVal.forEach((k, v) {
          questions.add(QuestionModel.fromJson(v));
        });
      }
      onUpdate(questions);
    });
  }

  Future<void> getQuestionsFor(Function(List<QuestionModel>) onUpdate) async {
    final userId = _auth.currentUser?.uid;
    databaseReference.child('questions/').orderByChild('userId').equalTo(userId).onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      var questions = <QuestionModel>[];
      if (dataSnapshot.value != null) {
        final keyVal = dataSnapshot.value as Map<dynamic, dynamic>;
        keyVal.forEach((k, v) {
          questions.add(QuestionModel.fromJson(v));
        });
      }
      onUpdate(questions);
    });
  }

  Future saveAnswer(AnswerModel answer) async {
    final userId = _auth.currentUser?.uid;
    var id = databaseReference.child('answers/').push();
    answer.answerId = id.key;
    answer.userId = userId;
    id.set(answer.toJson());
  }

  Future<void> getAnswersFor(String questionId, Function(List<AnswerModel>) onUpdate) async {
    databaseReference.child('answers/').orderByChild('questionId').equalTo(questionId).onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      var answers = <AnswerModel>[];
      if (dataSnapshot.value != null) {
        final keyVal = dataSnapshot.value as Map<dynamic, dynamic>;
        keyVal.forEach((k, v) {
          answers.add(AnswerModel.fromJson(v));
        });
      }
      onUpdate(answers);
    });
  }
}
