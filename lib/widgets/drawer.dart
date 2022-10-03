import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/auth/auth.dart';
import 'package:flutter_sample_app/pages/carousel_page.dart';
import 'package:flutter_sample_app/pages/clip_test_page.dart';
import 'package:flutter_sample_app/pages/create_todo_page.dart';
import 'package:flutter_sample_app/pages/list_view_sample_page.dart';
import 'package:flutter_sample_app/pages/modal_bottom_sheet_tutorial_page.dart';
import 'package:flutter_sample_app/pages/modal_test_page.dart';
import 'package:flutter_sample_app/pages/network_page.dart';
import 'package:flutter_sample_app/pages/notification_page.dart';
import 'package:flutter_sample_app/pages/post_list_page.dart';
import 'package:flutter_sample_app/pages/profile_page.dart';
import 'package:flutter_sample_app/pages/sample_page.dart';
import 'package:flutter_sample_app/pages/settings_page.dart';
import 'package:flutter_sample_app/pages/shared_page.dart';
import 'package:flutter_sample_app/pages/slider_image_page.dart';
import 'package:flutter_sample_app/pages/sliver_sample_page.dart';
import 'package:flutter_sample_app/pages/tab_bar_page.dart';
import 'package:flutter_sample_app/pages/test_page.dart';
import 'package:flutter_sample_app/pages/todo_list_page.dart';
import 'package:flutter_sample_app/pages/top_page.dart';
import 'package:flutter_sample_app/pages/transparent_app_bar_page.dart';
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
          ListTile(
            title: const Text('Profileページ'),
            onTap: () => Navigator.push<void>(context, ProfilePage.route()),
          ),
          ListTile(
            title: const Text('TabBarページ'),
            onTap: () => Navigator.push<void>(context, TabBarPage.route()),
          ),
          ListTile(
            title: const Text('Sampleページ'),
            onTap: () => Navigator.push<void>(context, SamplePage.route()),
          ),
          ListTile(
            title: const Text('Notificationページ'),
            onTap: () =>
                Navigator.push<void>(context, NotificationPage.route()),
          ),
          ListTile(
            title: const Text('Carouselページ'),
            onTap: () => Navigator.push<void>(context, CarouselPage.route()),
          ),
          ListTile(
            title: const Text('Testページ'),
            onTap: () => Navigator.push<void>(context, TestPage.route()),
          ),
          ListTile(
            title: const Text('SliderImageページ'),
            onTap: () => Navigator.push<void>(context, SliderImagePage.route()),
          ),
          ListTile(
            title: const Text('ModalTestページ'),
            onTap: () => Navigator.push<void>(context, ModalTestPage.route()),
          ),
          ListTile(
            title: const Text('TransparentAppBarページ'),
            onTap: () =>
                Navigator.push<void>(context, TransparentAppBarPage.route()),
          ),
          ListTile(
            title: const Text('Modal Bottom Sheet ページ'),
            onTap: () => Navigator.push<void>(
              context,
              ModalBottomSheetTutorialPage.route(),
            ),
          ),
          ListTile(
            title: const Text('Sharedページ'),
            onTap: () => Navigator.push<void>(context, SharedPage.route()),
          ),
          ListTile(
            title: const Text('ClipTestページ'),
            onTap: () => Navigator.push<void>(context, ClipTestPage.route()),
          ),
          ListTile(
            title: const Text('PostListページ'),
            onTap: () => Navigator.push<void>(context, PostListPage.route()),
          ),
        ],
      ),
    );
  }
}
