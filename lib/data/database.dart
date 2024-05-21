import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.openBox('mybox');

  // run this method if this is 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make things", false],
      ["Do some", false]
    ];
  }

}