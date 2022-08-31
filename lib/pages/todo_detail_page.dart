import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_sample_app/widgets/async_value_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoDetailPage extends HookConsumerWidget {
  const TodoDetailPage({
    super.key,
    required this.id,
  });

  static Route<dynamic> route({
    required int id,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => TodoDetailPage(
        id: id,
      ),
    );
  }

  /// 詳細画面で表示するTodoのid
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: AsyncValueHandler<Todo>(
        value: ref.watch(fetchTodoProvider(id)),
        builder: (todo) => Center(
          child: Column(
            children: [
              Text('id: ${todo.id.toString()}'),
              Text('title: ${todo.title}'),
              Text('content: ${todo.content}'),
            ],
          ),
        ),
        onRefresh: () => ref.refresh(fetchTodoProvider(id)),
      ),
    );
  }
}
