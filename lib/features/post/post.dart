import 'package:flutter_sample_app/models/post.dart';
import 'package:flutter_sample_app/repositories/post_repository.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [PostRepository]のfetchPosts()をコールして全てのPostを取得するProvider
final fetchPostsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  try {
    // await Future<dynamic>.delayed(const Duration(seconds: 3));
    final response = await ref.watch(postRepositoryProvider).fetchPosts();
    return response.posts;
  } on AppException {
    rethrow;
  }
});

/// [PostRepository]のchangePostFavoriteStatus()をコールしてPostのいいねのステータスを変更する
final changePostFavoriteStatus = Provider.autoDispose<
    Future<void> Function({
  required int postId,
  required bool isFavorite,
})>(
  (ref) => ({
    required postId,
    required isFavorite,
  }) async {
    try {
      await ref.watch(postRepositoryProvider).changePostFavoriteStatus(
            id: postId,
            isFavorite: isFavorite,
          );
    } on AppException {
      rethrow;
    }
  },
);
