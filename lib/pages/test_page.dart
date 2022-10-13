import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/expandable_text.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestPage extends HookConsumerWidget {
  const TestPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TestPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );

    useEffect(() {
      animationController.forward();
      return null;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Screen1')),
      body: Center(
        child: SizedBox(
          width: context.deviceWidth * 0.8,
          child: ListView(
            children: [
              const Card(
                child: ExpandableText(
                  text:
                      '雨ニモマケズ\n風ニモマケズ\n雪ニモ夏ノ暑サニモマケヌ\n丈夫ナカラダヲモチ\n慾ハナク\n決シテ瞋ラズ\nイツモシヅカニワラッテヰル\n一日ニ玄米四合ト\n味噌ト少シノ野菜ヲタベ\nアラユルコトヲジブンヲカンジョウニ入レズニ\nヨクミキキシワカリソシテワスレズ\n野原ノ松ノ林ノ蔭ノ\n小サナ萓ブキノ小屋ニヰテ\n東ニ病気ノコドモアレバ\n行ッテ看病シテヤリ\n西ニツカレタ母アレバ\n行ッテソノ稲ノ朿ヲ負ヒ\n南ニ死ニサウナ人アレバ\n行ッテコハガラナクテモイヽトイヒ\n北ニケンクヮヤソショウガアレバ\nツマラナイカラヤメロトイヒ\nヒドリノトキハナミダヲナガシ\nサムサノナツハオロオロアルキ\nミンナニデクノボートヨバレ\nホメラレモセズ\nクニモサレズ\nサウイフモノニ\nワタシハナリタイ',
                ),
              ),
              const Card(
                child: ExpandableText(
                  text:
                      '雨ニモマケズ\n風ニモマケズ\n雪ニモ夏ノ暑サニモマケヌ\n丈夫ナカラダヲモチ\n慾ハナク\n決シテ瞋ラズ\nイツモシヅカニワラッテヰル\n一日ニ玄米四合ト\n味噌ト少シノ野菜ヲタベ\nアラユルコトヲジブンヲカンジョウニ入レズニ\nヨクミキキシワカリソシテワスレズ\n野原ノ松ノ林ノ蔭ノ\n小サナ萓ブキノ小屋ニヰテ\n東ニ病気ノコドモアレバ\n行ッテ看病シテヤリ\n西ニツカレタ母アレバ\n行ッテソノ稲ノ朿ヲ負ヒ\n南ニ死ニサウナ人アレバ\n行ッテコハガラナクテモイヽトイヒ\n北ニケンクヮヤソショウガアレバ\nツマラナイカラヤメロトイヒ\nヒドリノトキハナミダヲナガシ\nサムサノナツハオロオロアルキ\nミンナニデクノボートヨバレ\nホメラレモセズ\nクニモサレズ\nサウイフモノニ\nワタシハナリタイ',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ColoredBox(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.abc),
                            Icon(Icons.ac_unit),
                            Icon(Icons.access_time_sharp),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    height: 20,
                    width: 20,
                  ),
                  const Expanded(
                    child: Spacer(),
                  ),
                ],
              ),
              const Gap(50),
              Center(
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1522748906645-95d8adfd52c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              const Gap(20),
              Center(
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: const NetworkImage(
                        'https://images.unsplash.com/photo-1522748906645-95d8adfd52c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      ),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedIcon(
                size: 150,
                icon: AnimatedIcons.play_pause,
                color: Colors.pink,
                progress: animationController,
              )
            ],
          ),
        ),
      ),

      // body: Column(
      //   children: [
      //     RichText(
      //       text: TextSpan(
      //         text: 'Hello ',
      //         style: context.defaultTextStyle,
      //         children: const [
      //           TextSpan(
      //             text: 'bold',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black,
      //             ),
      //           ),
      //           TextSpan(text: ' world!'),
      //         ],
      //       ),
      //     ),
      //     RichText(
      //       text: TextSpan(
      //         text: 'この記事を',
      //         style: context.defaultTextStyle,
      //         children: [
      //           TextSpan(
      //             text: 'あとで読む',
      //             style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.blueAccent,
      //             ),
      //             recognizer: TapGestureRecognizer()
      //               ..onTap =
      //                   () => Navigator.push<void>(context, Screen2.route()),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// class Screen2 extends StatelessWidget {
//   const Screen2({super.key});

//   static Route<dynamic> route() {
//     return MaterialPageRoute<dynamic>(
//       builder: (_) => const Screen2(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('戻る'),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//     );
//   }
// }

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
