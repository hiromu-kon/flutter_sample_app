import 'package:flutter/material.dart';
import 'package:flutter_sample_app/gen/assets.gen.dart';
import 'package:flutter_sample_app/pages/auth/sign_in_page.dart';
import 'package:flutter_sample_app/pages/auth/sign_up_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icon.image(height: 200),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.apple),
              label: const Text('Appleでサインイン'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata_rounded),
              label: const Text('Googleでサインイン'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('新規登録'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
              child: const Text('アカウントをお持ちの場合はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}
