import 'package:flutter/material.dart';
import 'package:quiz_game/api_services/api_service.dart';
import 'package:quiz_game/model/level3_model.dart';

class Level3 extends StatefulWidget {
  const Level3({super.key});

  @override
  State<Level3> createState() => _Level3State();
}

class _Level3State extends State<Level3> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionIndex;
  List<int?> correctAnswers=[];

  List<LevelThreeModelClass> levelThreeModel = [];

  getAllQuestions(){
    ApiService().levelThreeQuestions().then((value) {
      setState(() {
        levelThreeModel = value;
      });
      debugPrint(value.toString());
    }).onError((error,stackTrace){
      debugPrint(error.toString());
    });
  }
  
  void _nextQuestion(){
    setState(() {
      bool isCorrect = selectedOptionIndex == levelThreeModel[currentQuestionIndex].correctAnswerIndex;
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
    if(levelThreeModel.isEmpty){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text('QUIZ-LEVEL 3', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else
    if(currentQuestionIndex >= levelThreeModel.length){
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
          title: Text('QUIZ-LEVEL 3', style: TextStyle(color: Colors.white),),
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
              Text('Your Score: $score', style: TextStyle(fontSize: 24),),
              SizedBox(height: 10,),
              Text("Results:", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              for(int i=0;i<levelThreeModel.length;i++)
              ListTile(
                title: Text(levelThreeModel[i].question!),
                subtitle: Text(
                  correctAnswers[i]== null ? 'No answer given' :
                  'Your answer: ${levelThreeModel[i].options![correctAnswers[i]!]}',
                  style: TextStyle(color: correctAnswers[i]== null ? Colors.grey : (correctAnswers[i]== levelThreeModel[i].correctAnswerIndex ? Colors.green : Colors.red)),
                  ),
                  trailing: Text(
                    correctAnswers[i]==null ? 'No answer' : (correctAnswers[i] == levelThreeModel[i].correctAnswerIndex ? 'Correct' : 'Wrong'),
                    style: TextStyle(color: correctAnswers[i]== null ? Colors.grey : (correctAnswers[i]==levelThreeModel[i].correctAnswerIndex ? Colors.green: Colors.red),
                  ),
              )
              )
            ],
            
            ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('QUIZ-LEVEL 3', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(levelThreeModel[currentQuestionIndex].question!, style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            for(int i=0; i<levelThreeModel[currentQuestionIndex].options!.length;i++)
            ListTile(
              title: Text(levelThreeModel[currentQuestionIndex].options![i]),
              leading: Radio<int>(
                value: i, 
                groupValue: selectedOptionIndex, 
                onChanged: (int? value){
                  if(value != null){
                    _answerQuestion(value);
                  }
                }),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
            onPressed: _nextQuestion, 
            child: Text('Next Question'))
          ],
        ),
      ),
    );
  }
}