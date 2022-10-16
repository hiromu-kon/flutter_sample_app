import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/features/auth/auth.dart';
import 'package:flutter_sample_app/pages/main_page.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignUpPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormStateKey();
    final passwordFocusNode = useFocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
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
                    '新規登録',
                    style: context.h5,
                  ),
                  const Gap(30),
                  TextFormField(
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'パスワード',
                    ),
                    validator: Validator.password,
                    focusNode: passwordFocusNode,
                  ),
                  TwoButtonsWidget(
                    aboveGap: 50,
                    primaryText: '登録する',
                    onPrimaryPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref.read(signUpProvider).call(
                              onSuccess: () =>
                                  Navigator.pushAndRemoveUntil<void>(
                                context,
                                MainPage.route(),
                                (route) => false,
                              ),
                            );
                      }
                    },
                    secondaryText: '戻る',
                    onSecondaryPressed: () async => Navigator.pop(context),
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
