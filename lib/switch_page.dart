import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/pages/top_page.dart';
import 'package:flutter_sample_app/services/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SwitchPage extends HookConsumerWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _switchPage(context, ref.watch(sharedPreferencesServiceProvider)),
    );
    return Container();
  }

  Future<void> _switchPage(
    BuildContext context,
    SharedPreferencesService sharedPreferences,
  ) async {
    if (await sharedPreferences.getAccessToken() == '') {
      await Navigator.pushAndRemoveUntil<void>(
        context,
        TopPage.route(),
        (route) => true,
      );
    } else {
      await Navigator.pushAndRemoveUntil<void>(
        context,
        HomePage.route(),
        (route) => true,
      );
    }
  }
}
