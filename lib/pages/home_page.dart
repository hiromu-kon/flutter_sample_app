import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/account_detail_page.dart';
import 'package:flutter_sample_app/pages/message_list_page.dart';
import 'package:flutter_sample_app/pages/task_list_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final selectedIndex = useState<int>(0);
    final pageList = useState<List<Widget>>(
      const [
        TaskListPage(),
        MessageListPage(),
        AccountDetailPage(),
      ],
    );

    return Scaffold(
      appBar: const CommonAppBar(),
      endDrawer: const CommonDrawer(),
      body: PageView(
        controller: pageController,
        children: pageList.value,
        onPageChanged: (int index) {
          selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'タスク一覧'),
          BottomNavigationBarItem(icon: Icon(Icons.sms), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
        ],
        currentIndex: selectedIndex.value,
        onTap: (int index) {
          selectedIndex.value = index;
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
