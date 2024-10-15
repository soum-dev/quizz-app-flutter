import 'package:quizz_app/src/models/question_model.dart';

class Category {
  String name;
  String imageUrl;
  List<Question> questions;

  Category(this.name, this.imageUrl, this.questions);
  
}