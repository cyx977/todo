import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofinal/screens/task_copy.dart';
import 'models/taskprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context)=> TaskProvider(),
          child: MaterialApp(
        home: TasksScreen(),
        // home: Level1(),
      ),
    );
  }
}

// class Level1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Data>(
//       create: (context) => Data(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: MyText(),
//         ),
//         body: SafeArea(
//           child: Level2(),
//         ),
//       ),
//     );
//   }
// }

// class Level2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           MyTextField(),
//           Level3(),
//         ],
//       ),
//     );
//   }
// }

// class Level3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).data);
//   }
// }

// class MyText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).data);
//   }
// }

// class MyTextField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: true,
//       onChanged: (newVal) {
//         Provider.of<Data>(context, listen: false).changeData(newVal);
//         print(newVal);
//       },
//     );
//   }
// }

// class Data with ChangeNotifier {
//   String _data = "secret Strr";
//   String get data => _data;
//   void changeData(newData) {
//     _data = newData;
//     notifyListeners();
//   }
// }
