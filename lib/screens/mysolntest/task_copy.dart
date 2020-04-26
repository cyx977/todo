import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/models/taskprovider.dart';
import 'package:todofinal/widgets/mysolntest/tasks_list_copy.dart';
import 'package:todofinal/screens/mysolntest/add_task_screen_copy.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);

    return Scaffold(
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
                child: AddTaskScreen(),
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
                      provider.finishedTask == 0
                          ? TextSpan(
                              text: "${provider.finishedTask} ",
                              style: TextStyle(
                                  color: Colors.yellow, fontSize: 17.0),
                            )
                          : TextSpan(
                              text: "${provider.finishedTask} ",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                      TextSpan(text: "finished out of "),
                      TextSpan(
                        text: "${provider.taskList.length} ",
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
              child: TasksList(),
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
    );
  }
}
