import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class SharedPage extends HookConsumerWidget {
  const SharedPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SharedPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Share Sample'),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              const urlPreview =
                  'https://www.youtube.com/watch?v=CNUBhb_cM6E&t=0s';
              await Share.share(
                'This lion is cute\n\n$urlPreview',
              );
            },
            child: const Text('TextをShareする'),
          ),
          ElevatedButton(
            onPressed: () async {
              await Share.shareFiles(
                [Assets.images.appIcon.path],
                text: 'Great picture',
              );
            },
            child: const Text('アプリ画像をShareする'),
          ),
          ElevatedButton(
            onPressed: () async {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (image == null) {
                return;
              }

              await Share.shareFiles(
                [image.path],
                text: 'Great picture',
              );
            },
            child: const Text('画像をShareする'),
          )
        ],
      ),
    );
  }
}
