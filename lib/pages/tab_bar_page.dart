import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarPage extends HookConsumerWidget {
  const TabBarPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TabBarPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    final taskScrollController = useScrollController();
    final accountScrollController = useScrollController();
    final messageScrollController = useScrollController();

    final scrollControllerList = <ScrollController>[
      taskScrollController,
      accountScrollController,
      messageScrollController
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.task)),
              Tab(icon: Icon(Icons.account_box)),
              Tab(icon: Icon(Icons.message)),
            ],
            onTap: (index) {
              if (scrollControllerList[index].hasClients) {
                scrollControllerList[index].animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ListView.builder(
              controller: taskScrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              controller: accountScrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              controller: messageScrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
