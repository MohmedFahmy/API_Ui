import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model.dart';

class Data {
 static List<Model> myData = [];
  static getData() async {
     
    var repo =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (repo.statusCode == 200) {
      List bodyJson = jsonDecode(repo.body);
   myData  =
          bodyJson.map((json) => Model.fromJson(json)).toList();
      return myData;
    }
      return myData;

  }
}
