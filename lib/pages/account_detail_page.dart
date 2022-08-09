import 'package:flutter/material.dart';
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
    return const ColoredBox(
      color: Colors.blue,
    );
  }
}
