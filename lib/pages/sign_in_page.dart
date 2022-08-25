import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/features/auth/auth.dart';
import 'package:flutter_sample_app/pages/home_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormStateKey();
    final passwordFocusNode = useFocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: context.deviceWidth * 0.8,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(150),
                  Assets.images.icon.image(height: 150),
                  Text(
                    'ログイン',
                    style: context.h5,
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: ref.watch(emailTextEditingControllerProvider),
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'メールアドレス',
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(passwordFocusNode),
                    validator: Validator.email,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller:
                        ref.watch(passwordTextEditingControllerProvider),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'パスワード',
                    ),
                    validator: Validator.password,
                    focusNode: passwordFocusNode,
                  ),
                  TwoButtonsWidget(
                    aboveGap: 50,
                    primaryText: 'ログインする',
                    onPrimaryPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref.read(signInProvider).call(
                              onSuccess: () =>
                                  Navigator.pushAndRemoveUntil<void>(
                                context,
                                HomePage.route(),
                                (_) => false,
                              ),
                            );
                      }
                    },
                    secondaryText: '戻る',
                    onSecondaryPressed: () async => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
