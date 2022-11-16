import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/todo_list.dart';

import 'models/todo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}

_database() async => openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) => db.execute('''
CREATE TABLE todo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    note TEXT,
    creation_date INTEGER)
'''),
      version: 1,
    );

Future<void> insert(Todo todo) async {
  final db = await _database();
  await db.insert('todo', todo.toMap());
}

Future<List<Todo>> todoList() async {
  final db = await _database();

  final List<Map<String, dynamic>> maps = await db.query('todo');

  return List.generate(maps.length, (i) {
    return Todo(
      id: maps[i]['id'],
      note: maps[i]['note'],
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(maps[i]['creation_date']),
    );
  });
}

Future<void> deleteTodo(int id) async {
  final db = await _database();
  await db.delete(
    'todo',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> update(Todo todo) async {
  final db = await _database();
  await db.update(
    'todo',
    todo.toMap(),
    where: 'id = ?',
    whereArgs: [todo.id],
  );
}
