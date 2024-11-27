import 'dart:convert';

import 'package:quiz_game/model/level1_model.dart';
import "package:http/http.dart" as http;
import 'package:quiz_game/model/level2_model.dart';
import 'package:quiz_game/model/level3_model.dart';

class ApiService{

  Future<List<LevelOneModelClass>> levelOneQuestions()async{
    var response = await http.get(Uri.parse('https://mocki.io/v1/ad33fb4b-89e2-4f53-b376-d1873f2cdec2'));
    if(response.statusCode==200){
      return List<LevelOneModelClass>.from(jsonDecode(response.body).map((x)=>LevelOneModelClass.fromJson(x)));
    }else{
      throw Exception();
    }
  }

  Future<List<LevelTwoModelClass>> levelTwoQuestions()async{
    var response = await http.get(Uri.parse('https://mocki.io/v1/a0e480c8-8e9e-4391-87c5-ca4e6e760656'));
    if(response.statusCode==200){
      return List<LevelTwoModelClass>.from(jsonDecode(response.body).map((x)=>LevelOneModelClass.fromJson(x)));
    }else{
      throw Exception();
    }
  }

  Future<List<LevelThreeModelClass>> levelThreeQuestions()async{
    var response = await http.get(Uri.parse('https://mocki.io/v1/72c73e33-4e49-472a-a0b0-b06ca036003a'));
    if(response.statusCode==200){
      return List<LevelThreeModelClass>.from(jsonDecode(response.body).map((x)=>LevelOneModelClass.fromJson(x)));
    }else{
      throw Exception();
    }
  }
}