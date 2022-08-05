import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/hooks/hooks.dart';
import 'package:flutter_sample_app/pages/account/account_detail_page.dart';
import 'package:flutter_sample_app/providers/overlay_loading/overlay_loading.dart';
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
                    primaryText: 'ログインする',
                    onPrimaryPressed: () async {
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(overlayLoadingProvider.notifier)
                            .update((_) => true);
                        await Future<void>.delayed(const Duration(seconds: 3));
                        ref
                            .read(overlayLoadingProvider.notifier)
                            .update((_) => false);

                        context.showSnackBar(
                          'ログインしました',
                          backgroundColor: Colors.green,
                        );
                        await Navigator.push<void>(
                          context,
                          AccountDetailPage.route(),
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
