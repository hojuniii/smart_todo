import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class IconProvider extends ChangeNotifier {
  
  List<Todo> todoItem = [
  Todo(
    setTime: "11.14 am",
    task: "Go to grocery",
    time: "in 3hrs 34 mins",
    labelColor: Colors.pink,
    isComplete: false,
  ),
  Todo(
    setTime: "11.14 am",
    task: "Watch movie",
    time: "in 3hrs 34 mins",
    labelColor: Colors.blue,
    isComplete: false,
  ),
  Todo(
    setTime: "11.14 am",
    task: "Buy book",
    time: "in 3hrs 34 mins",
    labelColor: Colors.green,
    isComplete: false,
  ),
  Todo(
    setTime: "11.14 am",
    task: "Play Soccer",
    time: "in 3hrs 34 mins",
    labelColor: Colors.yellow,
    isComplete: false,
  ),
];
  void toggle(int index){
    todoItem[index].isComplete = !todoItem[index].isComplete;
    
    notifyListeners();
  }
}

class Todo {
  final String setTime;
  final String task;
  final String time;
  final Color labelColor;
  bool isComplete;

  Todo({this.setTime, this.task, this.time, this.labelColor,this.isComplete});
}