import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/main_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListPage extends HookConsumerWidget {
  const TaskListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = TabItem.taskList.title;

    final firstCount = useState<int>(0);
    final secondCount = useState<int>(0);

    return Scaffold(
      appBar: CommonAppBar(title: pageTitle),
      endDrawer: const CommonDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => firstCount.value++,
              icon: const Text('🔥'),
              label: Text(firstCount.value.toString()),
              style: AppButtonStyle.emojiIconButton,
            ),
            Tooltip(
              message: 'iconです',
              child: ElevatedButton.icon(
                onPressed: () => secondCount.value++,
                icon: const Text('😢'),
                label: Text(secondCount.value.toString()),
                style: AppButtonStyle.emojiIconButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
