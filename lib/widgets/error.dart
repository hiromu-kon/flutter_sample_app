import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({
    super.key,
    required this.error,
    required this.onRefresh,
  });

  final Object error;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            iconSize: 60,
          ),
          Text(
            error.toString(),
          ),
        ],
      ),
    );
  }
}
