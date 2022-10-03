import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpandableText extends HookConsumerWidget {
  const ExpandableText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = context.defaultTextStyle;
        final textSpan = TextSpan(text: text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: 8,
        )..layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(
              //   text,
              //   style: textStyle,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: isExpanded.value ? null : 5,
              // ),
              isExpanded.value
                  ? Text(
                      text,
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Text(
                          text,
                          style: textStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                        Container(
                          height: 40,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ],
                    ),
              const Gap(4),
              TextButton(
                onPressed: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: Text(isExpanded.value ? '閉じる' : '続きを読む'),
              )
            ],
          );
        } else {
          return Text(
            text,
            style: textStyle,
            maxLines: 8,
          );
        }
      },
    );
  }
}
