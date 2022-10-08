import 'package:flutter_sample_app/features/todo/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

final addTasksProvider = Provider.family
    .autoDispose<Future<void> Function(), Tuple2<String, String>>(
  (ref, Tuple2<String, String> param) => () async {
    await ref.read(editTodoProvider).call(todoId: 'aiueo');
  },
);

// final myTasksProvider = FutureProvider.autoDispose
//     .family<List<Task>, Tuple3<String, String, String>>((ref, param) async {
//   final feelings =
//       await ref.watch(feelingRepositoryProvider).getFeelingsByUserId(
//             roomId: param.item1,
//             votingEventId: param.item2,
//             userId: param.item3,
//           );
//   return feelings;
// });
