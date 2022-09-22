import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Sliverを利用したサンプル
///
///
class SliverSamplePage extends HookConsumerWidget {
  const SliverSamplePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SliverSamplePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);

    final item = <String>[
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'X',
      'Y',
      'Z',
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Sample'),
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.grid_3x3)),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          controller: tabController,
          children: [
            // ListView Sample
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  toolbarHeight: 150,
                  pinned: true,
                  centerTitle: true,
                  title: Text(
                    'List Sample',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  leading: SizedBox(),
                  backgroundColor: Colors.black,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _listTileItem(item[index]),
                    childCount: item.length,
                  ),
                ),
              ],
            ),
            // GridView Sample
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  toolbarHeight: 150,
                  pinned: true,
                  centerTitle: true,
                  title: Text(
                    'Grid Sample',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  leading: SizedBox(),
                  backgroundColor: Colors.black,
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _gridTileItem(item[index]),
                    childCount: item.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTileItem(String item) {
    return SizedBox(
      height: 100,
      child: ListTile(
        title: Center(
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        tileColor: Color(
          (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
        ).withOpacity(1),
      ),
    );
  }

  Widget _gridTileItem(String item) {
    return ColoredBox(
      color: Color(
        (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
      ).withOpacity(1),
      child: Center(
        child: Text(
          item,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
