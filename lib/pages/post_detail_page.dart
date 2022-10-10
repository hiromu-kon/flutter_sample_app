import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDetailPage extends HookConsumerWidget {
  const PostDetailPage({super.key, required this.post});

  static Route<dynamic> route({
    required Post post,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => PostDetailPage(
        post: post,
      ),
    );
  }

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
