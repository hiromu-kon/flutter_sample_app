import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_sample_app/pages/create_todo_page.dart';
import 'package:flutter_sample_app/pages/edit_todo_page.dart';
import 'package:flutter_sample_app/pages/todo_detail_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TodoListPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Todo一覧'),
      body: RefreshIndicator(
        onRefresh: () async => await ref.refresh(fetchTodosProvider.future),
        child: ref.watch(fetchTodosProvider).when(
              data: (todos) {
                ref
                    .watch(cachedTodosProvider.notifier)
                    .update((state) => todos);

                return _TodoListView(
                  todos: todos,
                );
              },
              error: (e, stack) => CommonErrorWidget(
                error: e,
                onRefresh: () => ref.refresh(fetchTodosProvider),
              ),
              loading: () {
                final cachedTodos =
                    ref.watch(cachedTodosProvider.notifier).state;
                return cachedTodos.isNotEmpty
                    ? _TodoListView(todos: cachedTodos)
                    : const CommonLoadingWidget();
              },
            ),
      ),
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

class _TodoListView extends StatelessWidget {
  const _TodoListView({
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            EditTodoPage.route(todo: todos[index]),
          ),
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}

/// AsyncValueHandleを使ったサンプル

// class _TodoListView extends HookConsumerWidget {
//   const _TodoListView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AsyncValueHandler<List<Todo>>(
//       value: ref.watch(fetchTodosProvider),
//       builder: (todos) => ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(todos[index].title),
//           subtitle: Text(todos[index].content),
//           onTap: () => Navigator.push<void>(
//             context,
//             TodoDetailPage.route(
//               id: todos[index].id,
//             ),
//           ),
//           trailing: IconButton(
//             onPressed: () => Navigator.push<void>(
//               context,
//               EditTodoPage.route(
//                 title: todos[index].title,
//                 content: todos[index].content,
//               ),
//             ),
//             icon: const Icon(Icons.more_vert),
//           ),
//         ),
//       ),
//     );
//   }
// }


/// useProviderCachedを使ったサンプル

// class TodoListPage extends HookConsumerWidget {
//   const TodoListPage({super.key});

//   static Route<dynamic> route() {
//     return MaterialPageRoute<dynamic>(
//       builder: (_) => const TodoListPage(),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final fetchTodos = ref.watch(fetchTodosProvider);
//     final fetchTodosCached = useProviderCached(fetchTodos);
//     return Scaffold(
//       appBar: const CommonAppBar(title: 'Todo一覧'),
//       body: RefreshIndicator(
//         onRefresh: () async => await ref.refresh(fetchTodosProvider),
//         child: fetchTodosCached.when(
//           data: (todos) {
//             return _TodoListView(
//               todos: todos,
//             );
//           },
//           error: (e, stack) => CommonErrorWidget(
//             error: e,
//             onRefresh: () => ref.refresh(fetchTodosProvider),
//           ),
//           loading: () {
//             final cachedTodos = ref.watch(cachedTodosProvider.notifier).state;
//             return cachedTodos.isNotEmpty
//                 ? _TodoListView(todos: cachedTodos)
//                 : const CommonLoadingWidget();
//           },
//         ),
//       ),
//     );
//   }
// }

// class _TodoListView extends StatelessWidget {
//   const _TodoListView({
//     required this.todos,
//   });

//   final List<Todo> todos;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: todos.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(todos[index].title),
//         subtitle: Text(todos[index].content),
//         onTap: () {},
//       ),
//     );
//   }
// }
