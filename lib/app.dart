import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/switch_page.dart';
import 'package:flutter_sample_app/widgets/loading/loading.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // const flavor = String.fromEnvironment('FLAVOR');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
