import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/pages/main_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageListPage extends HookConsumerWidget {
  const MessageListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = TabItem.messageList.title;

    final items = useState<List<Widget>>([
      Container(color: Colors.pink, height: 100),
      Container(color: Colors.orange, height: 100),
      Container(color: Colors.yellow, height: 100),
    ]);

    final colors = <Color>[
      Colors.yellow,
      Colors.orange,
      Colors.pink,
    ];

    return Scaffold(
      appBar: CommonAppBar(title: pageTitle),
      endDrawer: const CommonDrawer(),
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(
        //   parent: AlwaysScrollableScrollPhysics(),
        // ),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(const Duration(milliseconds: 1500));
              items.value.insert(
                0,
                Container(color: colors[items.value.length % 3], height: 100),
              );
              // print('refresh');
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items.value[index],
              childCount: items.value.length,
            ),
          ),
        ],
      ),
    );

    // return Row(
    //   children: [
    //     SizedBox(
    //       height: 100,
    //       width: 100,
    //       child: Stack(
    //         children: [
    //           Icon(
    //             Icons.notifications,
    //             size: 100,
    //             color: Colors.blue,
    //           ),
    //           Align(
    //             alignment: Alignment.topRight,
    //             child: CircleAvatar(
    //               child: Text(
    //                 '3',
    //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    //               ),
    //               backgroundColor: Colors.pink,
    //               foregroundColor: Colors.white,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    // return Center(
    //   child: SizedBox(
    //     width: 200,
    //     height: 200,
    //     child: Stack(
    //       alignment: Alignment.topRight,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(14),
    //           child: Image.network(
    //             'https://www.apple.com/v/apple-events/home/n/images/november-2020/meta/og__fodnljjkwl6y.png?202011081645',
    //             width: 200,
    //             height: 200,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         CircleAvatar(
    //           radius: 20,
    //           backgroundColor: Colors.black,
    //           child: IconButton(
    //             icon: const Icon(
    //               Icons.close,
    //               size: 20,
    //             ),
    //             onPressed: () {
    //               print('onPressed');
    //             },
    //             splashRadius: 0.1,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
