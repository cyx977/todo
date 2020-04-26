import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool checked;
  final Function onChangedCallback;
  final String taskText;

  TaskTile({this.checked = false, this.onChangedCallback, this.taskText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: TextStyle(
          decoration: checked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checked,
        onChanged: onChangedCallback,
      ),
    );
  }
}
