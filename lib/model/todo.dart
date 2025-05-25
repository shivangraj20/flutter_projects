import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  Map<String,dynamic> toJson(){
    return{
      'id':  id,
      'todoText': todoText,
      'isDone': isDone,
    };
  }

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(id: json['id'], todoText: json['todoText'],
    isDone: json['isDone'],);
  }

  static Future<void> saveTasks(List<ToDo> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('task_list', encoded);
  }

  static Future<List<ToDo>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('task_list');
    if (data != null) {
      final List<dynamic> decoded = jsonDecode(data);
      return decoded.map((item) => ToDo.fromJson(item)).toList();
    }
    return [];
  }
}