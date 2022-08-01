import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/gen/assets.gen.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../hooks/hooks.dart';
import '../../utils/utils.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});
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
                        return;
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
