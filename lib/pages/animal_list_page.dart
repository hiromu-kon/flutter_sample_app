import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimalListPage extends StatefulHookConsumerWidget {
  const AnimalListPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const AnimalListPage(),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends ConsumerState<AnimalListPage> {
  // 動物の名前を保持しているリスト
  List<String> animalList = [
    'dog',
    'cat',
    'elephant',
    'rabbit',
    'dog',
    'cat',
    'elephant',
    'rabbit',
    'dog',
    'cat',
    'elephant',
    'rabbit',
    'dog',
    'cat',
    'elephant',
    'rabbit'
  ];
  // 実際に画面に表示するリスト
  List<String> displayList = [
    'dog',
    'cat',
    'elephant',
    'rabbit',
    'dog',
    'cat',
    'elephant',
    'rabbit'
  ];
  // 次に追加したいanimalListの要素におけるインデックス
  int lastIndex = 0;

  @override
  void initState() {
    // animalListの最初の要素を追加
    displayList.add(animalList[lastIndex]);
    // 次の要素を追加するためにインクリメント
    lastIndex++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            final before = scrollNotification.metrics.extentBefore;
            final max = scrollNotification.metrics.maxScrollExtent;
            if (before == max) {
              if (animalList.length == lastIndex) return false;
              setState(() {
                displayList.add(animalList[lastIndex]);
                lastIndex++;
              });
              return true;
            }
          }
          return false;
        },
        child: ListView.builder(
          itemCount: displayList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(displayList[index]),
            );
          },
        ),
      ),
    );
  }
}
