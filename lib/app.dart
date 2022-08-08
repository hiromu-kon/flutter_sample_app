import 'package:flutter/material.dart';
import 'package:flutter_sample_app/switch_page.dart';
import 'package:flutter_sample_app/utils/gen/fonts.gen.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/loading/loading.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
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
