import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FullScreenImagePage extends HookConsumerWidget {
  const FullScreenImagePage({
    super.key,
    required this.imageSrc,
    required this.heroTag,
  });

  static Route<dynamic> route({
    required String imageSrc,
    required String heroTag,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => FullScreenImagePage(
        imageSrc: imageSrc,
        heroTag: heroTag,
      ),
    );
  }

  final String imageSrc;
  final String heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Hero(
        tag: heroTag,
        child: Image.network(imageSrc),
      ),
    );
  }
}
