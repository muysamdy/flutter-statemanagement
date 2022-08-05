import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/model/todo_model.dart';

part 'filter_todo_event.dart';

part 'filter_todo_state.dart';

class FilterTodoBloc extends Bloc<FilterTodoEvent, FilterTodoState> {
  final List<Todo> initialTodos;

  FilterTodoBloc({
    required this.initialTodos,
  }) : super(FilterTodoState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodoEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });

  }
}
