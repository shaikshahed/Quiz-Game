import 'package:flutter/material.dart';
import 'package:quiz_game/api_services/api_service.dart';
import 'package:quiz_game/model/level1_model.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionIndex;
  List<int?> correctAnswers = [];
  // bool isLoading = false;

  List<LevelOneModelClass> levelOneModel = [];

  getAllQuestions(){
    ApiService().levelOneQuestions().then((value){
      setState(() {
        levelOneModel = value;
        // isLoading=true;
      });
      // isLoading = false;
      debugPrint("value: ${value.toString()}");
    }).onError((error, stackTrace){
      debugPrint(error.toString());
    });
  }

  void _answerQuestion(int selectedIndex) {
    setState(() {
      selectedOptionIndex = selectedIndex;
      print('selected option');
    });
  }

  @override
  void initState() {
    getAllQuestions();
    super.initState();
  }
  

  void _nextQuestion() {
    setState(() {
           bool isCorrect = selectedOptionIndex == levelOneModel[currentQuestionIndex].correctAnswerIndex;
          print('iscorrect');
      correctAnswers.add(selectedOptionIndex);
      if (isCorrect) {
        score++;
      }
      currentQuestionIndex++;
      selectedOptionIndex = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (levelOneModel.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text('QUIZ-LEVEL 1', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else
    if (currentQuestionIndex >= levelOneModel.length) {
      print("currentquestionindex:$currentQuestionIndex");
      print('length:${levelOneModel.length}');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text('QUIZ-LEVEL 1', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Score: $score',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Results:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                for (int i = 0; i < levelOneModel.length; i++,print('length2:${levelOneModel.length}')
)
                  ListTile(
  title: Text(levelOneModel[i].question!),
  subtitle: Text(
    correctAnswers[i] == null
      ? 'No answer given'
      : 'Your answer: ${levelOneModel[i].options![correctAnswers[i]!]}',
    style: TextStyle(
      color: correctAnswers[i] == null
        ? Colors.grey
        : (correctAnswers[i] == levelOneModel[i].correctAnswerIndex
            ? Colors.green
            : Colors.red),
    ),
  ),
  trailing: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        correctAnswers[i] == null
          ? "Correct answer: ${levelOneModel[i].options![levelOneModel[i].correctAnswerIndex!]}"
          : (correctAnswers[i] == levelOneModel[i].correctAnswerIndex
              ? "Correct!"
              : "Correct answer: ${levelOneModel[i].options![levelOneModel[i].correctAnswerIndex!]}"),
        style: TextStyle(
          color: correctAnswers[i] == null
            ? Colors.grey
            : (correctAnswers[i] == levelOneModel[i].correctAnswerIndex
                ? Colors.green
                : Colors.red),
        ),
      ),
    ],
  ),
)
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('QUIZ-LEVEL 1', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              child: Container(
                width: double.infinity,
                child: Image(image: NetworkImage('https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExMW9zemVobDZvOXI2Y2U2OTZuaHZuano4amw1bmFwOTIxNDZxbWNhZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3y2eEpmGrauCGh2edL/giphy.webp'),
                height: 240,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              levelOneModel[currentQuestionIndex].question!,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            for (int i = 0; i < levelOneModel[currentQuestionIndex].options!.length; i++)
              ListTile(
                title: Text(levelOneModel[currentQuestionIndex].options![i]),
                leading: Radio<int>(
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.blue;
                    }
                    return Colors.grey;
                  }),
                  value: i,
                  groupValue: selectedOptionIndex,
                  onChanged: (int? value) {
                    if (value != null) {
                      _answerQuestion(value);
                    }
                  },
                ),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.blue[300]
                ),
                onPressed: _nextQuestion,
                child: Text('Next Question' , style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
