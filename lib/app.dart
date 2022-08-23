import 'package:flutter/material.dart';
import 'package:flutter_sample_app/switch_page.dart';
import 'package:flutter_sample_app/utils/gen/fonts.gen.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: ColorName.primary),
        ),
        fontFamily: FontFamily.yuseiMagic,
      ),
      home: const SwitchPage(),
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            if (child != null) child,
            const OverlayLoadingWidget(),
          ],
        );
      },
    );
  }
}
