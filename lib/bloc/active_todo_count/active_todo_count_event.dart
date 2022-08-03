part of 'active_todo_count_bloc.dart';

abstract class ActiveTodoCountEvent extends Equatable {
  const ActiveTodoCountEvent();
}

class CalculateActiveTodoCountEvent extends ActiveTodoCountEvent {
  final int activeTodoCount;

  const CalculateActiveTodoCountEvent({required this.activeTodoCount});

  @override
  String toString() => 'CalculateActiveTodoCountEvent{activeTodoCount: $activeTodoCount}';

  @override
  List<Object> get props => [activeTodoCount];
}
