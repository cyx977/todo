import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/models/task.dart';
import 'package:todofinal/widgets/tasks_list.dart';
import 'package:todofinal/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> taskList = [];
  int finishedTask;


  @override
  initState() {
    super.initState();
    calculateFinishedTaskCallback();
  }


  void calculateFinishedTaskCallback() {
    int temp = 0;
    taskList.forEach((t) {
      if (t.isDone) {
        temp++;
      }
    });
    setState(() {
      finishedTask = temp;
    });
  }

  String test = "wtf";

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return test;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(
                    onPressedCallback: (String text) {
                      setState(() {
                        taskList.add(Task(name: text));
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        finishedTask == 0
                            ? TextSpan(
                                text: "$finishedTask ",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 17.0),
                              )
                            : TextSpan(
                                text: "$finishedTask ",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                        TextSpan(text: "finished out of "),
                        TextSpan(
                          text: "${taskList.length} ",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: "tasks",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TasksList(
                  calculateFinishedTaskCallback: calculateFinishedTaskCallback,
                  tasks: taskList,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
