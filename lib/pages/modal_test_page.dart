import 'package:flutter/material.dart';

class ModalTestPage extends StatelessWidget {
  const ModalTestPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ModalTestPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('開く'),
          onPressed: () => firstModal(context),
        ),
      ),
    );
  }

  void firstModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () => secondModal(context),
            child: const Text('二つ目を開く'),
          ),
        );
      },
    );
  }

  void secondModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () => thirdModal(context),
            child: const Text('三つ目を開く'),
          ),
        );
      },
    );
  }

  void thirdModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.pop(context);
              // Navigator.pop(context);

              // 参考記事:
              // https://qiita.com/Riscait/items/6a8660b9c4a64ac66d99
              // https://www.yukiiworks.com/archives/10382#:~:text=int%20count%20%3D%200%3B-,Navigator.,%E3%81%AE%E7%94%BB%E9%9D%A2%E6%95%B0%E6%88%BB%E3%82%8C%E3%81%BE%E3%81%99%E3%80%82
              var count = 0;
              Navigator.popUntil(context, (_) => count++ >= 3);
            },
            child: const Text('全て閉じる'),
          ),
        );
      },
    );
  }
}
