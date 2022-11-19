import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoGetAllEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            final list = state is TodoUpdated ? state.list : [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final item = list[i];
                return Dismissible(
                  key: Key(item.id!.toString()),
                  onDismissed: (direction) {
                    context.read<TodoBloc>().add(
                          TodoDeleteEvent(id: item.id!),
                        );
                  },
                  child: ListTile(
                    title: Text(list[i].note!),
                    subtitle: Text(list[i].creationDate!.toString(),
                        textAlign: TextAlign.end),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TodoBloc>().add(
                  TodoAddEvent(
                    todo: Todo(
                      note: 'Test 1',
                      creationDate: DateTime.now(),
                    ),
                  ),
                );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
}
