import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkPage extends HookConsumerWidget {
  const NetworkPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const NetworkPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkConnected = useNetworkConnected();

    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Network',
      ),
      body: Text(
        networkConnected.toString(),
      ),
    );
  }
}
