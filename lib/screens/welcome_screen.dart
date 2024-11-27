import 'package:flutter/material.dart';
import 'package:quiz_game/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Quiz.png',
                height: 300,
              ),
              SizedBox(height: 40,),
              Text('Quizz',
               style: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold),),              
            SizedBox(height: 15,),
            Text('Challenge your knowledge, test your skills,', style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text('and see how much you can Score', style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.orange, 
                textStyle: TextStyle(fontSize: 20)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }, child: Text('Start Quiz'))
            ],
          ),
        ),
      ),
    );
  }
}