import 'package:flutter/material.dart';
import 'package:todofinal/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _taskList = [];
  int _finishedTask=0;

  

  //getters
  int get finishedTask => _finishedTask;
  List<Task> get taskList => _taskList;

  void addTask(String text) {
    taskList.add(Task(name: text));
    notifyListeners();
  }

  void calculateFinishedTask() {
    int temp = 0;
    taskList.forEach((t) {
      if (t.isDone) {
        temp++;
      }
    });
    _finishedTask = temp;
    notifyListeners();
  }

  void removeTask(String taskName){
    _taskList.removeWhere((task) => task.name == taskName );
    calculateFinishedTask(); //this contains notifyListeners(); so no need to add
  }
  
}
