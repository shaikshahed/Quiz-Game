import 'package:flutter/material.dart';
import 'package:quiz_game/levels/level1.dart';
import 'package:quiz_game/levels/level2.dart';
import 'package:quiz_game/levels/level3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [Colors.green, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ),
          // boxShadow: [BoxShadow(
          //   color: Colors.grey.withOpacity(0.5),
          //   spreadRadius: 5,
          //   blurRadius: 7
          // )
          // ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Column(
            children: [
             Container(
                width: double.infinity,
                height: 370,
                child:Image.asset(
                'assets/Quiztime.png',
              ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildLevelBox(context,'Level 1', Colors.blue, Level1()),
                    SizedBox(height: 15,),
                    buildLevelBox(context,'Level 2', Colors.green,Level2()),
                    SizedBox(height: 15,),
                    buildLevelBox(context,'Level 3', Colors.red, Level3()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

 Widget buildLevelBox(BuildContext context, String level, Color color, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,),
          child: Text(
            level,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }