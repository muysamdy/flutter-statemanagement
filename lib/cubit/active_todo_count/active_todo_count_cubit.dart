// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:todo_cubit/cubit/todo_list/todo_list_cubit.dart';
//
// import '../../model/todo_model.dart';
//
// part 'active_todo_count_state.dart';
//
// class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
//   final int initialActiveTodoCount;
//
//   ActiveTodoCountCubit({
//     required this.initialActiveTodoCount,
//   }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));
//
//   void calculateActiveTodoCount(int activeTodoCount) {
//     emit(state.copyWith(activeTodoCount: activeTodoCount));
//   }
// }
