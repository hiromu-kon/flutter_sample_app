import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/widgets/wrapped_notification_listener.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const NotificationPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingMore = useState<bool>(false);
    return Scaffold(
      appBar: AppBar(),
      body: WrappedNotificationListener(
        onLoadMore: () async {
          isLoadingMore.value = true;
          await Future<void>.delayed(const Duration(seconds: 2));
          ref.read(numberProvider.state).update((state) {
            state
              ..add(state.last + 1)
              ..add(state.last + 1)
              ..add(state.last + 1)
              ..add(state.last + 1)
              ..add(state.last + 1);
            return state;
          });
          isLoadingMore.value = false;
        },
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await Future<void>.delayed(const Duration(milliseconds: 1500));
                // print('refresh');
              },
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    Text(ref.watch(numberProvider)[index].toString()),
                childCount: ref.watch(numberProvider).length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Visibility(
                  visible: isLoadingMore.value,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

final numberProvider = StateProvider<List<int>>(
  (ref) => [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ],
);
