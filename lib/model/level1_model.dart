// import 'package:equatable/equatable.dart';

// class LevelOneModel extends Equatable{
//   final String question;
//   final List<String> options;
//   final int correctAnswerIndex;

//   const LevelOneModel({
//     required this.question,
//     required this.options,
//     required this.correctAnswerIndex,
//   });

//   @override
//   List<Object?> get props => [question, options];

//   static List<LevelOneModel> sampleQuestions = [
//     LevelOneModel(
//       question: "what is the Capital of India?", 
//      options: ["Hyderabad", "Delhi","Mumbai","Chennai"],
//      correctAnswerIndex: 1,
//      ),
//      LevelOneModel(
//       question: "when was the last time India won an Icc Trophy?", 
//       options: ["2013","2017","2021","2023"],
//       correctAnswerIndex: 0,
//       ),
//     LevelOneModel(
//       question: "Charminar was built by ?", 
//       options: ["Shahjahan","Aurangazeb","Ashoka","Quli QutubShah"],
//       correctAnswerIndex: 3,
//       ),
//        LevelOneModel(
//       question: "Most handsome and stylish hero of Engro Technologies", 
//       options: ["kanna","Giri","Giridhar","All of the above"],
//       correctAnswerIndex: 3,
//       )
//   ];
// }

class LevelOneModelClass {
  int? id;
  String? question;
  List<String>? options;
  int? correctAnswerIndex;

  LevelOneModelClass(
      {this.id, this.question, this.options, this.correctAnswerIndex});

  LevelOneModelClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswerIndex = json['correctAnswerIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correctAnswerIndex'] = this.correctAnswerIndex;
    return data;
  }
}
