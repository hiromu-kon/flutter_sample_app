import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageListPage extends HookConsumerWidget {
  const MessageListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ColoredBox(
      color: Colors.green,
    );
  }
}
