import 'package:flutter/material.dart';
import 'package:todofinal/models/task.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  final Function calculateFinishedTaskCallback;
  final List<Task> tasks;
  TasksList({this.tasks, this.calculateFinishedTaskCallback});
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          checked: this.widget.tasks[index].isDone,
          taskText: this.widget.tasks[index].name,
          onChangedCallback: (checkboxValue) {
            setState(() {
              this.widget.tasks[index].toggleDone();
            });
            widget.calculateFinishedTaskCallback();
          },
        );
      },
      itemCount: this.widget.tasks.length,
    );
  }
}
