import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/pages/create_todo_page.dart';
import 'package:flutter_sample_app/pages/edit_todo_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TodoListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Todo一覧'),
      body: const _TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push<void>(
          context,
          CreateTodoPage.route(),
        ),
      ),
    );
  }
}

class _TodoListView extends HookConsumerWidget {
  const _TodoListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchTodosProvider).when(
          data: (todos) => ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].title),
              subtitle: Text(todos[index].content),
              onTap: () {
                // todos[index];
                Navigator.push<void>(
                  context,
                  EditTodoPage.route(),
                );
              },
            ),
          ),
          error: (e, stack) => CommonErrorWidget(error: e),
          loading: () => const CommonLoadingWidget(),
        );
  }
}
