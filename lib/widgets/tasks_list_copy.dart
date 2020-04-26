import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/models/taskprovider.dart';
import 'task_tile_copy.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TaskProvider>(context);

    return Consumer<TaskProvider>(
      builder: (context,provider, child){
        return ListView.builder(
        itemBuilder: (context, index) {
          var task = provider.taskList[index];
          return TaskTile(
            longPressCallback: (){
              provider.removeTask(task.name);
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Deleted ${task.name}"),));
            },
            checked: task.isDone,
            taskText: task.name,
            onChangedCallback: (checkboxValue) {
              task.toggleDone();
              provider.calculateFinishedTask();
            },
          );
        },
        itemCount: provider.taskList.length,
      );
      },
    );
  }
}
