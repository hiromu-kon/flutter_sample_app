import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/auth/auth.dart';
import 'package:flutter_sample_app/pages/create_todo_page.dart';
import 'package:flutter_sample_app/pages/list_view_sample_page.dart';
import 'package:flutter_sample_app/pages/network_page.dart';
import 'package:flutter_sample_app/pages/settings_page.dart';
import 'package:flutter_sample_app/pages/shared_page.dart';
import 'package:flutter_sample_app/pages/sliver_sample_page.dart';
import 'package:flutter_sample_app/pages/todo_list_page.dart';
import 'package:flutter_sample_app/pages/top_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonDrawer extends HookConsumerWidget {
  const CommonDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('ログアウト'),
            onTap: () async {
              await ref.read(signOutProvider).call(
                    onSuccess: () => Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil<void>(
                      TopPage.route(),
                      (_) => false,
                    ),
                  );
            },
          ),
          ListTile(
            title: const Text('設定'),
            onTap: () => Navigator.push<void>(context, SettingsPage.route()),
          ),
          ListTile(
            title: const Text('Todo一覧'),
            onTap: () => Navigator.push<void>(context, TodoListPage.route()),
          ),
          ListTile(
            title: const Text('Todoを追加する'),
            onTap: () => Navigator.push<void>(context, CreateTodoPage.route()),
          ),
          ListTile(
            title: const Text('ネットワークページ'),
            onTap: () => Navigator.push<void>(context, NetworkPage.route()),
          ),
          ListTile(
            title: const Text('ListView Sampleページ'),
            onTap: () =>
                Navigator.push<void>(context, ListViewSamplePage.route()),
          ),
          ListTile(
            title: const Text('Sliver Sampleページ'),
            onTap: () =>
                Navigator.push<void>(context, SliverSamplePage.route()),
          ),
          // ListTile(
          //   title: const Text('Sharedページ'),
          //   onTap: () => Navigator.push<void>(context, SharedPage.route()),
          // ),
        ],
      ),
    );
  }
}
