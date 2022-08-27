import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
      ),
    );
  }
}
