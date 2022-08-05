import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: Assets.images.icon.image(),
      ),
      endDrawer: const Drawer(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('test'),
          )
        ],
      ),
    );
  }
}
