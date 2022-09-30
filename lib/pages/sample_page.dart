import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SamplePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              child: _buildImage(),
            ),
            ClipOval(
              child: _buildImage(),
            ),
            ClipPath(
              clipper: TriangleClipper(),
              child: _buildImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1522748906645-95d8adfd52c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
