import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/database.dart';

import '../models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is TodoGetAllEvent) {
        await _getAll(emit);
      } else if (event is TodoAddEvent) {
        await _add(emit, event.todo);
      } else if (event is TodoDeleteEvent) {
        await _delete(emit, event.id);
      }
    });
  }

  _getAll(Emitter<TodoState> emit) async {
    final list = await todoList();
    emit(TodoUpdated(list: list));
  }

  _add(Emitter<TodoState> emit, Todo todo) async {
    await insert(todo);
    final list = await todoList();
    emit(TodoUpdated(list: list));
  }

  _delete(Emitter<TodoState> emit, int id) async {
    await deleteTodo(id);
    final list = await todoList();
    emit(TodoUpdated(list: list));
  }
}
