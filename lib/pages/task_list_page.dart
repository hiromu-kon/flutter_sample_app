import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/main_page.dart';
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
      body: Center(
        child: button(),
      ),
    );
  }

  ElevatedButton button() {
    final context = useContext();
    return ElevatedButton(
      onPressed: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => Container(),
      ),
      child: const Text('Button'),
    );
  }

  Text display() {
    final context = useContext();
    return Text(
      'Hello World',
      style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 5),
    );
  }
}
