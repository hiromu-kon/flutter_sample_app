import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/sign_in_page.dart';
import 'package:flutter_sample_app/pages/sign_up_page.dart';
import 'package:flutter_sample_app/utils/extensions/context.dart';
import 'package:flutter_sample_app/utils/gen/assets.gen.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TopPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.deviceWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.appIcon.image(height: 200),
              PrimaryIconButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                onPressed: () async {},
                text: 'Appleでサインイン',
                backgroundColor: Colors.black,
              ),
              const Gap(10),
              PrimaryIconButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                onPressed: () async {},
                text: 'Googleでサインイン',
              ),
              const Gap(10),
              PrimaryButton(
                onPressed: () async {
                  await Navigator.push<void>(
                    context,
                    SignUpPage.route(),
                  );
                },
                text: '新規登録',
              ),
              TextButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    SignInPage.route(),
                  );
                },
                child: const Text('アカウントをお持ちの場合はこちら'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
