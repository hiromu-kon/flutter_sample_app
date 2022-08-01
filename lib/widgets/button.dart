import 'package:flutter/material.dart';
import 'package:flutter_sample_app/gen/colors.gen.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:gap/gap.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.radius = 20,
    this.backgroundColor = ColorName.primary,
    this.width,
    this.height,
  });

  final Future<void> Function() onPressed;
  final String text;
  final double radius;
  final Color backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.deviceWidth,
      height: height ?? 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.radius = 20,
    this.backgroundColor,
    this.width,
    this.height,
  });

  final Future<void> Function() onPressed;
  final String text;
  final double radius;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.deviceWidth,
      height: height ?? 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: const BorderSide(color: ColorName.primary),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: ColorName.primary,
          ),
        ),
      ),
    );
  }
}

class TwoButtonsWidget extends StatelessWidget {
  const TwoButtonsWidget({
    super.key,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
    required this.primaryText,
    required this.secondaryText,
    this.aboveGap = 0,
    this.belowGap = 0,
    this.gap = 30,
  });

  final Future<void> Function() onPrimaryPressed;
  final Future<void> Function() onSecondaryPressed;
  final String primaryText;
  final String secondaryText;
  final double aboveGap;
  final double belowGap;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(aboveGap),
        PrimaryButton(
          onPressed: onPrimaryPressed,
          text: primaryText,
        ),
        Gap(gap),
        SecondaryButton(
          onPressed: onSecondaryPressed,
          text: secondaryText,
        ),
        Gap(belowGap),
      ],
    );
  }
}
