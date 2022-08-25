import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/pages/top_page.dart';
import 'package:flutter_sample_app/pages/tutorial_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
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
    if (!await sharedPreferences.getIsLaunched()) {
      // 初めての起動の場合、チュートリアルページへ遷移する
      await NoAnimationRoute.pushAndRemoveUntil<void>(
        context,
        const TutorialPage(),
      );
    } else if (await sharedPreferences.getAccessToken() == '') {
      // アクセストークンを持っていない場合、ログイン前のページに遷移する
      await NoAnimationRoute.pushAndRemoveUntil<void>(
        context,
        const TopPage(),
      );
    } else {
      // すでに起動済みでアクセストークンを持っている場合、ホームページへ遷移する
      await NoAnimationRoute.pushAndRemoveUntil<void>(
        context,
        const HomePage(),
      );
    }
  }
}
