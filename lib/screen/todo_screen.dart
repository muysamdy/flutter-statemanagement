import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/blocs.dart';
import 'package:todo_cubit/model/todo_model.dart';
import 'package:todo_cubit/screen/create_todo.dart';
import 'package:todo_cubit/screen/search_and_filter_todo.dart';
import 'package:todo_cubit/screen/show_todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                const TodoHeader(),
                const CreateTodo(),
                const SizedBox(height: 20.0),
                SearchAndFilterTodo(),
                const ShowTodo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TODO",
          style: TextStyle(fontSize: 40.0),
        ),
        BlocConsumer<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int _activeTodoCount =
                state.todos.where((Todo todo) => !todo.completed).toList().length;

            context
                .read<ActiveTodoCountBloc>()
                .add(CalculateActiveTodoCountEvent(activeTodoCount: _activeTodoCount));
          },
          builder: (context, state) {
            return BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
              builder: (context, state) {
                return Text(
                  "${state.activeTodoCount} items left",
                  style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
                );
              },
            );
          },
        )
      ],
    );
  }
}
