import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListPage extends HookConsumerWidget {
  const TaskListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = TabItem.taskList.title;
    return Scaffold(
      appBar: CommonAppBar(title: pageTitle),
      endDrawer: const CommonDrawer(),
      body: const Text('task page'),
    );
  }
}
