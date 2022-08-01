import 'package:flutter/material.dart';
import 'package:flutter_sample_app/providers/overlay_loading/overlay_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverlayLoadingWidget extends HookConsumerWidget {
  const OverlayLoadingWidget({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlayLoading = ref.watch(overlayLoadingProvider);

    return Visibility(
      visible: overlayLoading,
      child: ColoredBox(
        color: backgroundColor,
        child: const SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
