import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/account_detail_page.dart';
import 'package:flutter_sample_app/pages/message_list_page.dart';
import 'package:flutter_sample_app/pages/task_list_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.taskList: GlobalKey<NavigatorState>(),
  TabItem.messageList: GlobalKey<NavigatorState>(),
  TabItem.accountDetail: GlobalKey<NavigatorState>(),
};

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = useState<TabItem>(TabItem.messageList);

    return Scaffold(
      body: Stack(
        children: TabItem.values
            .map(
              (tabItem) => Offstage(
                offstage: currentTab.value != tabItem,
                child: Navigator(
                  key: _navigatorKeys[tabItem],
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute<Widget>(
                      builder: (context) => tabItem.page,
                    );
                  },
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: TabItem.values.indexOf(currentTab.value),
        items: TabItem.values
            .map(
              (tabItem) => BottomNavigationBarItem(
                icon: Icon(tabItem.icon),
                label: tabItem.title,
              ),
            )
            .toList(),
        onTap: (index) {
          // ③ 選択済なら第一階層まで pop / 未選択なら currentTab に指定
          final selectedTab = TabItem.values[index];
          if (currentTab.value == selectedTab) {
            _navigatorKeys[selectedTab]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            currentTab.value = selectedTab;
          }
        },
      ),
    );
  }
}

enum TabItem {
  taskList(
    title: 'タスク一覧',
    icon: Icons.checklist,
    page: TaskListPage(),
  ),

  messageList(
    title: 'メッセージ',
    icon: Icons.sms,
    page: MessageListPage(),
  ),

  accountDetail(
    title: 'マイページ',
    icon: Icons.person,
    page: AccountDetailPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}
