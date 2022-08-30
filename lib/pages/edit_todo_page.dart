import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditTodoPage extends HookConsumerWidget {
  const EditTodoPage({
    super.key,
    required this.todo,
  });

  static Route<dynamic> route({
    required Todo todo,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EditTodoPage(
        todo: todo,
      ),
    );
  }

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormStateKey();
    final contentFocusNode = useFocusNode();

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(titleTextEditingControllerProvider).text = todo.title;
          ref.read(contentTextEditingControllerProvider).text = todo.content;
        });

        return null;
      },
      [],
    );

    return Scaffold(
      appBar: const CommonAppBar(title: 'Todo編集'),
      body: Center(
        child: SizedBox(
          width: context.deviceWidth * 0.8,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Todo編集',
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
                    await ref.read(editTodoProvider(todo.id.toString()));

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
