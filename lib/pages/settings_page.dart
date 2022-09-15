import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/gelocation_sample_page.dart';
import 'package:flutter_sample_app/pages/theme_mode_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SettingsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: '設定'),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable custom theme'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                onPressed: (context) => Navigator.push<void>(
                  context,
                  GeolocationSamplePage.route(),
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Application'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.color_lens),
                title: const Text('Application Mode'),
                value: const Text('Dark Mode'),
                onPressed: (context) =>
                    Navigator.push<void>(context, ThemeModePage.route()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
