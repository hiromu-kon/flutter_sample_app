import 'package:flutter/material.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Riverpod の AsyncValue を良い感じに処理する Widget
class AsyncValueHandler<T extends Object> extends StatelessWidget {
  const AsyncValueHandler({
    super.key,
    required this.value,
    required this.builder,
    required this.onRefresh,
    this.loading,
  });

  final AsyncValue<T?> value;
  final Widget Function(T) builder;
  final void Function() onRefresh;
  final Widget Function()? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) => data == null ? const SizedBox() : builder(data),
      error: (e, s) => CommonErrorWidget(
        error: e,
        onRefresh: onRefresh,
      ),
      loading: loading ?? () => const CommonLoadingWidget(),
    );
  }
}
