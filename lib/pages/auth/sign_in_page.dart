import 'package:flutter/material.dart';
import 'package:flutter_sample_app/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Column(
              children: [
                Assets.images.icon.image(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
