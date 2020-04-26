import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/models/taskprovider.dart';
import '../task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);

    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          checked: provider.taskList[index].isDone,
          taskText:  provider.taskList[index].name,
          onChangedCallback: (checkboxValue) {
            setState(() {
               provider.taskList[index].toggleDone();
            });
            // widget.calculateFinishedTaskCallback();
            provider.calculateFinishedTask();
          },
        );
      },
      itemCount:  provider.taskList.length,
    );
  }
}
