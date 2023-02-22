import 'dart:convert';

import 'package:http/http.dart';


class Todo {
  Future<List<Map<String, dynamic>>> getTodo() async {
    Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      final jsonData = jsonDecode(response.body);
      final List<Map<String, dynamic>> todos = List<Map<String, dynamic>>.from(jsonData);
      return todos;
    }
  }
