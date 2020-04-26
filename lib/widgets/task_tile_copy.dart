import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool checked;
  final Function onChangedCallback;
  final String taskText;
  final Function longPressCallback;

  TaskTile({this.checked = false, this.onChangedCallback, this.taskText, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPressCallback,
      child: ListTile(
        title: Text(
          taskText,
          style: TextStyle(
            decoration: checked ? TextDecoration.lineThrough : null,
            fontSize: 25.0,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: checked,
          onChanged: onChangedCallback,
        ),
      ),
    );
  }
}
