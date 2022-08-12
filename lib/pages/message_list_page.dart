import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageListPage extends HookConsumerWidget {
  const MessageListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = TabItem.messageList.title;
    return Scaffold(
      appBar: CommonAppBar(title: pageTitle),
      endDrawer: const CommonDrawer(),
      body: Stack(
        children: [
          Image.network(
            'https://lh3.googleusercontent.com/a-/AOh14GhuX9JPJNOqUMKAf4LqUISvo-fU2UFLMfVw0ZDUS_8=s96-c',
            width: context.deviceWidth * 0.15,
          ),
          const Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              child: Text(
                '3',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
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
