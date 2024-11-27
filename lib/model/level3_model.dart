// import 'package:equatable/equatable.dart';

// class LevelThreeModel extends Equatable{
//   final String question;
//   final List<String> options;
//   final int correctAnswerIndex;

//   LevelThreeModel({
//     required this.question, 
//     required this.options, 
//     required this.correctAnswerIndex});
    
//     @override
//     List<Object?> get props => [question, options,correctAnswerIndex];

//     static List<LevelThreeModel> sampleQuestions = [
//       LevelThreeModel(
//         question: "who is the first women prime minister of india?", 
//         options: ["Indira gandhi", "sonia gandhi","smriti irani","None of the above"], 
//         correctAnswerIndex: 0),
//       LevelThreeModel(
//         question: "which city is called as city of dreams?", 
//         options: ["Hyderabad","Delhi","Mumbai","chennai"], 
//         correctAnswerIndex: 2),
//         LevelThreeModel(
//         question: "is Giridhar single?", 
//         options: ["No","Definetly No","all of the above"], 
//         correctAnswerIndex: 2),
//         LevelThreeModel(
//         question: "who is the President of India in 2024 ?", 
//         options: ["Draupadi murmu","manmohan singh","Narendra modi","Ram nath kovind"], 
//         correctAnswerIndex: 0),
//         LevelThreeModel(
//         question: "first Indian to win oscar award ?", 
//         options: ["AR Rahaman","Bhanu athaiya","shahrukh khan","SS Rajamouli"],
//         correctAnswerIndex: 1)
//     ];
// }


class LevelThreeModelClass {
  int? id;
  String? question;
  List<String>? options;
  int? correctAnswerIndex;

  LevelThreeModelClass(
      {this.id, this.question, this.options, this.correctAnswerIndex});

  LevelThreeModelClass.fromJson(Map<String, dynamic> json) {
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

