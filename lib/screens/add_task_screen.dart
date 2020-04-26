import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  
  final Function onPressedCallback;

  AddTaskScreen({this.onPressedCallback});

  final addTaskText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              autofocus: true,
              style: TextStyle(
                fontSize: 20.0,
              ),
              controller: addTaskText,
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.lightBlueAccent,
              onPressed: (){
                print("add");
                onPressedCallback(addTaskText.text);
                addTaskText.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}