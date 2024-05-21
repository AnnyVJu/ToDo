import 'package:flutter/material.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:to_do_app/util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [["Make app", false],
  ["Do Exercise", false]];

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),);
    });
}

void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
          child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),);
        },

      ),
    );
  }
}
