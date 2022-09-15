import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/application/application.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModePage extends HookConsumerWidget {
  const ThemeModePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ThemeModePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedThemeMode = ref.watch(applicationProvider).selectedThemeMode;
    return Scaffold(
      appBar: const CommonAppBar(title: 'テーマ設定'),
      body: ListView.builder(
        itemCount: ThemeMode.values.length,
        itemBuilder: (context, index) {
          final themeMode = ThemeMode.values[index];
          return RadioListTile<ThemeMode>(
            value: themeMode,
            title: Text(themeMode.title),
            subtitle: Text(themeMode.subtitle),
            secondary: Icon(themeMode.iconData),
            groupValue: selectedThemeMode,
            onChanged: (newTheme) {
              if (newTheme != null) {
                ref
                    .read(applicationProvider.notifier)
                    .changeSelectedTheme(newTheme);
              }
            },
          );
        },
      ),
    );
  }
}
