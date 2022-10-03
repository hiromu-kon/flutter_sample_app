import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/utils/scaffold_messenger_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

/// いいねボタン
class FavoriteButton extends HookConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.addFavorite,
    required this.deleteFavorite,
  });

  final bool isFavorite;
  final Future<void> Function() addFavorite;
  final Future<void> Function() deleteFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteState = useState<bool>(isFavorite);
    final isLoading = useState<bool>(false);
    return isFavoriteState.value
        ? IconButton(
            icon: const Icon(Icons.favorite),
            color: Colors.red,
            onPressed: isLoading.value
                ? null
                : () async {
                    try {
                      isLoading.value = true;
                      await deleteFavorite();
                      isFavoriteState.value = false;
                    } on Exception catch (_) {
                      ref
                          .read(scaffoldMessengerServiceProvider)
                          .showSnackBar('いいねに失敗しました');
                    } finally {
                      isLoading.value = false;
                    }
                  },
          )
        : IconButton(
            icon: const Icon(Icons.favorite),
            color: Colors.grey,
            onPressed: isLoading.value
                ? null
                : () async {
                    try {
                      isLoading.value = true;
                      await addFavorite();
                      isFavoriteState.value = true;
                    } on Exception catch (_) {
                      ref
                          .read(scaffoldMessengerServiceProvider)
                          .showSnackBar('いいねに失敗しました');
                    } finally {
                      isLoading.value = false;
                    }
                  },
          );
  }
}

// Widget likeButton() {
//   return LikeButton(
//     onTap: (isLiked) async {
//       try {
//         isLoading.value = true;
//         await addFavorite();
//         await deleteFavorite();
//         isFavoriteState.value = isLiked;
//         return null;
//       } on Exception catch (_) {
//         ref.read(scaffoldMessengerServiceProvider).showSnackBar('いいねに失敗しました');

//         return null;
//       } finally {
//         isLoading.value = false;
//       }
//     },
//     isLiked: true,
//     likeBuilder: (bool isLiked) {
//       return Icon(
//         Icons.favorite,
//         color: isLiked ? Colors.red : Colors.grey,
//       );
//     },
//   );
// }
