import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pingo_learn_assignment/Models/comment.dart';
import 'package:pingo_learn_assignment/Utils/field_validation.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';
class NetworkManager{

  final Uri url = Uri.parse("https://jsonPlaceholder.typicode.com/comments");
  Future<List<Comment>?> getComments() async {
    var response = await http.get(url);
    if(response.statusCode == 200){
      List<dynamic> decodedJSon = jsonDecode(response.body);
      List<Comment> comments = decodedJSon.map((e) => Comment.fromJson(e)).toList();
      return comments;

    }else{
      FieldValidation.showError(PLString.networkError);
    }
    return [];
  }
}