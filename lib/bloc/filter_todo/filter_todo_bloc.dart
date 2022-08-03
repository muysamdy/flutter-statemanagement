import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/bloc/blocs.dart';
import 'package:todo_cubit/model/todo_model.dart';

part 'filter_todo_event.dart';

part 'filter_todo_state.dart';

class FilterTodoBloc extends Bloc<FilterTodoEvent, FilterTodoState> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final List<Todo> initialTodos;

  final TodoFilterBloc todoFilterBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoListBloc todoListBloc;

  FilterTodoBloc({
    required this.initialTodos,
    required this.todoFilterBloc,
    required this.todoSearchBloc,
    required this.todoListBloc,
  }) : super(FilterTodoState(filteredTodos: initialTodos)) {
    todoFilterSubscription =
        todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {});

    todoSearchSubscription =
        todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {});

    todoListSubscription = todoListBloc.stream.listen((TodoListState todoListState) {});
    on<CalculateFilteredTodoEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });

    void setFilteredTodos() {
      List<Todo> _filteredTodos;

      switch (todoFilterBloc.state.filter) {
        case Filter.active:
          _filteredTodos =
              todoListBloc.state.todos.where((Todo todo) => !todo.completed).toList();
          break;

        case Filter.completed:
          _filteredTodos =
              todoListBloc.state.todos.where((Todo todo) => todo.completed).toList();
          break;

        case Filter.all:
        default:
          _filteredTodos = todoListBloc.state.todos;
          break;
      }
      if (todoSearchBloc.state.searchTerm.isNotEmpty) {
        _filteredTodos = _filteredTodos
            .where((Todo todo) =>
                todo.desc.toLowerCase().contains(todoSearchBloc.state.searchTerm))
            .toList();
      }
      // emit(state.copyWith(filteredTodos: _filteredTodos));
      add(CalculateFilteredTodoEvent(filteredTodos: _filteredTodos));
    }
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
