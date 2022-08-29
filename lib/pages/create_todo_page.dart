import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateTodoPage extends HookConsumerWidget {
  const CreateTodoPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CreateTodoPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormStateKey();
    final contentFocusNode = useFocusNode();

    return Scaffold(
      appBar: const CommonAppBar(title: 'Todo追加'),
      body: Center(
        child: SizedBox(
          width: context.deviceWidth * 0.8,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Todo追加',
                  style: context.h5,
                ),
                const Gap(30),
                TextFormField(
                  controller: ref.watch(titleTextEditingControllerProvider),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'タイトル',
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(contentFocusNode),
                  validator: Validator.title,
                ),
                const Gap(20),
                TextFormField(
                  controller: ref.watch(contentTextEditingControllerProvider),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '内容',
                  ),
                  validator: Validator.content,
                  focusNode: contentFocusNode,
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(editTodoProvider('1'));

                    Navigator.pop(context);
                  },
                  child: const Text('編集する'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
