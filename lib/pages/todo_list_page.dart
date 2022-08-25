import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_sample_app/pages/create_todo_page.dart';
import 'package:flutter_sample_app/pages/edit_todo_page.dart';
import 'package:flutter_sample_app/pages/todo_detail_page.dart';
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodoListView extends HookConsumerWidget {
  const _TodoListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler<List<Todo>>(
      value: ref.watch(fetchTodosProvider),
      builder: (todos) => RefreshIndicator(
        onRefresh: () async => ref.refresh(fetchTodosProvider),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].content),
            onTap: () => Navigator.push<void>(
              context,
              TodoDetailPage.route(
                id: todos[index].id,
              ),
            ),
            trailing: IconButton(
              onPressed: () => Navigator.push<void>(
                context,
                EditTodoPage.route(
                  title: todos[index].title,
                  content: todos[index].content,
                ),
              ),
              icon: const Icon(Icons.more_vert),
            ),
          ),
        ),
      ),
    );
  }
}
