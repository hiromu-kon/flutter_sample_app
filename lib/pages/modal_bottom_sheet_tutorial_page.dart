import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalBottomSheetTutorialPage extends HookConsumerWidget {
  const ModalBottomSheetTutorialPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ModalBottomSheetTutorialPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => buildSheet(),
                );
              },
              text: 'Simple Sheet',
            ),
            buildButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => buildSheet(),
                );
              },
              text: 'Full Screen Sheet',
            ),
            buildButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => buildSheet(),
                );
              },
              text: 'Scrollable Sheet',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required void Function() onPressed,
    required String text,
  }) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Widget buildSheet() => ListView(
        children: [
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
}
