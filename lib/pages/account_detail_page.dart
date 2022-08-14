import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/utils/gen/assets.gen.dart';
import 'package:flutter_sample_app/utils/gen/colors.gen.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDetailPage extends HookConsumerWidget {
  const AccountDetailPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const AccountDetailPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = TabItem.accountDetail.title;
    return Scaffold(
      appBar: CommonAppBar(title: pageTitle),
      endDrawer: const CommonDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(Assets.images.icon.path),
              ),
              const Gap(20),
              Column(
                children: const [
                  Text('ニックネーム'),
                  Text('つくし'),
                ],
              ),
              const Icon(
                Icons.edit,
                color: ColorName.primary,
              ),
            ],
          ),
          const Gap(30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('メールアドレス'),
                  Text('パスワード'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('パスワード'),
                  Text('************'),
                  Text('パスワードを変更する'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
