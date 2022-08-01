import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/top_page/top_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SwitchPage extends HookConsumerWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showInitPage(context));
      return null;
    });

    return const Scaffold();
  }

  Future<void> _showInitPage(BuildContext context) async {
    await Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const TopPage(),
      ),
      (route) => false,
    );
  }
}
