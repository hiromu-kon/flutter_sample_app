import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ClipTestPage extends StatelessWidget {
  const ClipTestPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ClipTestPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(50),
          Container(
            color: Colors.red,
            width: 300,
            height: 300,
          ),
          const Gap(50),
          ClipPath(
            clipper: ImageClipper(),
            child: Container(
              color: Colors.red,
              width: 300,
              height: 300,
            ),
          ),
          ClipRect(
            // clipper: ImageClipper(),
            child: Container(
              color: Colors.red,
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

/// ①
// class ImageClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path()
//       ..lineTo(0, 0)
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

/// ②
class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
