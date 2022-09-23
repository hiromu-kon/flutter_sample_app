import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ListViewとGridViewを利用したサンプル
///
/// ListViewをネストした場合、エラーが表示される。
/// そのためshrinkWrapをtrueにするとエラーが解消される。
///
/// しかし、
///
/// https://twitter.com/_mono/status/1496468087633510408
class ListViewSamplePage extends HookConsumerWidget {
  const ListViewSamplePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ListViewSamplePage(),
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
        title: const Text('ListView Sample'),
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
          children: <Widget>[
            // ListView Sample
            Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'List Sample',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: item.length,
                    itemBuilder: (context, index) => _listTileItem(item[index]),
                  ),
                ),
              ],
            ),
            // GridView Sample
            Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Grid Sample',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: item.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => _gridTileItem(item[index]),
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

// class ListViewSamplePage extends HookConsumerWidget {
//   const ListViewSamplePage({super.key});

//   static Route<dynamic> route() {
//     return MaterialPageRoute<dynamic>(
//       builder: (_) => const ListViewSamplePage(),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final item = <String>[
//       '0',
//       '1',
//       '2',
//       '3',
//       '4',
//       '5',
//       '6',
//       '7',
//       '8',
//       '9',
//       'A',
//       'B',
//       'C',
//       'D',
//       'E',
//       'F',
//       'G',
//       'H',
//       'I',
//       'J',
//       'K',
//       'L',
//       'M',
//       'N',
//       'O',
//       'P',
//       'Q',
//       'R',
//       'S',
//       'T',
//       'U',
//       'V',
//       'X',
//       'Y',
//       'Z',
//       'a',
//       'b',
//       'c',
//       'd',
//       'e',
//       'f',
//       'g',
//       'h',
//       'i',
//       'j',
//       'k',
//       'l',
//       'm',
//       'n',
//       'o',
//       'p',
//       'q',
//       'r',
//       's',
//       't',
//       'u',
//       'v',
//       'w',
//       'x',
//       'y',
//       'z',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ListView Sample'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 150,
//               color: Colors.black,
//               child: const Center(
//                 child: Text(
//                   'Sample Widget',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//             ),
//             ListView.builder(
//               padding: EdgeInsets.zero,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: item.length,
//               itemBuilder: (context, index) => _listItem(item[index]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _listItem(String item) {
//     return SizedBox(
//       height: 100,
//       child: ListTile(
//         title: Center(
//           child: Text(
//             item,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 40,
//             ),
//           ),
//         ),
//         tileColor: Color(
//           (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
//         ).withOpacity(1),
//       ),
//     );
//   }
// }
