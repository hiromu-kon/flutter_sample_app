import 'package:flutter/material.dart';
import 'package:flutter_sample_app/features/post/post.dart';

import 'package:flutter_sample_app/widgets/favorite_button.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostListPage extends HookConsumerWidget {
  const PostListPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const PostListPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(fetchPostsProvider).when(
            data: (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                onTap: _onTap,
                title: Text(posts[index].title),
                subtitle: Text(posts[index].content),
                leading: FavoriteButton(
                  isFavorite: posts[index].isFavorite,
                  addFavorite: () async {
                    await Future<void>.delayed(const Duration(seconds: 2));
                    await ref.read(changePostFavoriteStatus).call(
                          postId: posts[index].id,
                          isFavorite: true,
                        );
                  },
                  deleteFavorite: () async {
                    await Future<void>.delayed(const Duration(seconds: 2));
                    await ref.read(changePostFavoriteStatus).call(
                          postId: posts[index].id,
                          isFavorite: false,
                        );
                  },
                ),
              ),
            ),
            error: (error, stack) => ErrorWidget(error),
            loading: CommonLoadingWidget.new,
          ),
    );
  }

  Future<void> _onTap() async {
    // Navigator.push(context, route);
  }
}
