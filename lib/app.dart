import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/application/application.dart';
import 'package:flutter_sample_app/start_up_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedThemeMode = ref.watch(applicationProvider).selectedThemeMode;

    return MaterialApp(
      scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
      theme: selectedThemeMode == ThemeMode.dark
          ? getAppThemeDark()
          : getAppThemeLight(),
      darkTheme: selectedThemeMode == ThemeMode.light
          ? getAppThemeLight()
          : getAppThemeDark(),
      home: const StartUpPage(),
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              if (child != null) child,
              const OverlayLoadingWidget(),
            ],
          ),
        );
      },
    );
  }
}
