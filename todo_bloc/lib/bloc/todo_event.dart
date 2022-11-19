part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoGetAllEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  const TodoAddEvent({required this.todo});
  final Todo todo;
  @override
  List<Object> get props => [todo];
}

class TodoDeleteEvent extends TodoEvent {
  const TodoDeleteEvent({required this.id});
  final int id;
  @override
  List<Object> get props => [id];
}
