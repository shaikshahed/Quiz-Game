import 'package:flutter/material.dart';
import 'package:quiz_game/api_services/api_service.dart';
import 'package:quiz_game/model/level2_model.dart';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  int score =0;
  List<int?> correctAnswers = [];

  List<LevelTwoModelClass> levelTwoModel = [];

  getAllQuestions(){
    ApiService().levelTwoQuestions().then((value) {
      setState(() {
        levelTwoModel = value;
      });
      debugPrint(value.toString());
    }).onError((error,stackTrace){
      debugPrint(error.toString());
    });
  }
  void _nextQuestion(){
    setState(() {
      bool isCorrect = selectedOptionIndex == levelTwoModel[currentQuestionIndex].correctAnswerIndex;
      print("iscorrect: $isCorrect");
      correctAnswers.add(selectedOptionIndex);
      if(isCorrect){
        score++;
      }
      currentQuestionIndex++;
      selectedOptionIndex = null;
    });
  }

  void _answerQuestion(int selectedIndex){
    setState(() {
      selectedOptionIndex = selectedIndex;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(levelTwoModel.isEmpty){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text('QUIZ-LEVEL 2', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else
    if(currentQuestionIndex >= levelTwoModel.length){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('QUIZ-LEVEL 2', style: TextStyle(color: Colors.white,),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Score: $score', style: TextStyle(fontSize: 24),),
              SizedBox(height: 16,),
              Text('Results:', style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              
              for(int i=0;i<levelTwoModel.length;i++)
              ListTile(
                title: Text(levelTwoModel[i].question!),
                subtitle: Text(
                    correctAnswers[i] == null
                        ? 'No answer given'
                        : 'Your answer: ${levelTwoModel[i].options![correctAnswers[i]!]}',                
                        style: TextStyle(
                  color: correctAnswers[i] ==null ? Colors.grey : (correctAnswers[i] == levelTwoModel[i].correctAnswerIndex ? Colors.green : Colors.red)
                ),),
                trailing: Text(
                  correctAnswers[i] == null ? "No answer" :(correctAnswers[i] == levelTwoModel[i].correctAnswerIndex
                   ? "correct" : "wrong"),
                  style: TextStyle(
                    color: correctAnswers[i] == null ?Colors.grey : (correctAnswers[i] == levelTwoModel[i].correctAnswerIndex ? Colors.green : Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Level 2-Quiz', style: TextStyle(color: Colors.white,),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              width: double.infinity,
              child: Image(image: NetworkImage('https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExMW9zemVobDZvOXI2Y2U2OTZuaHZuano4amw1bmFwOTIxNDZxbWNhZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3y2eEpmGrauCGh2edL/giphy.webp'),
              height: 240,),
            ),
            SizedBox(height: 10,),
            Text(levelTwoModel[currentQuestionIndex].question!,
            style: TextStyle(fontSize: 20),),
            for(int i =0;i< levelTwoModel[currentQuestionIndex].options!.length;i++)
            ListTile(
              title: Text(levelTwoModel[currentQuestionIndex].options![i]),
              leading: Radio<int>(
                fillColor: WidgetStateProperty.resolveWith<Color>((states){
                  if(states.contains(WidgetState.selected)){
                    return Colors.blue;
                  }
                  return Colors.grey;
                }),
              value: i, 
              groupValue: selectedOptionIndex, 
              onChanged: (int? value) { 
                if(value!=null){
                  _answerQuestion(value);
                }
               },)
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _nextQuestion,
           child: Text('Next Question'))
          ],
        ),
      ),
    );
  }
}