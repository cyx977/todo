import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/models/taskprovider.dart';
import 'package:todofinal/screens/add_task_screen_copy.dart';
import 'package:todofinal/widgets/tasks_list_copy.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mainali's App"),
        actions: <Widget>[
          Icon(
            Icons.settings,
          ),
          Icon(
            Icons.brightness_3,
          ),
        ],
      ),
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
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.group_work,
                        color: Colors.blue,
                        size: 55,
                      ),
                    ),
                    Text(
                      "Todo-App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        provider.finishedTask == 0
                            ? TextSpan(
                                text: "${provider.finishedTask} ",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : TextSpan(
                                text: "${provider.finishedTask} ",
                                style: TextStyle(
                                  color: Colors.purple[100],
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
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
