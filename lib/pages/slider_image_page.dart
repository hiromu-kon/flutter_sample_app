import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/full_screen_image_page.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SliderImagePage extends HookConsumerWidget {
  const SliderImagePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SliderImagePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Slider Image Page'),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              _buildPostUserWidget(),
              const Gap(10),
              _buildPostImageWidget(index, context),
              _buildPostActionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostUserWidget() {
    return Row(
      children: [
        const Gap(10),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1559305616-3f99cd43e353?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Gap(20),
        const Text('David L. Wiggins'),
      ],
    );
  }

  Widget _buildPostImageWidget(int index, BuildContext context) {
    const imageSrc =
        'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2FmZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60';
    final heroTag = 'image$index';
    return GestureDetector(
      onTap: () => Navigator.push<void>(
        context,
        FullScreenImagePage.route(imageSrc: imageSrc, heroTag: heroTag),
      ),
      child: Hero(
        tag: heroTag,
        child: Image.network(
          imageSrc,
          fit: BoxFit.fill,
          width: double.infinity,
          height: 250,
        ),
      ),
    );
  }

  Widget _buildPostActionWidget() {
    return Row(
      children: const [
        Icon(Icons.star_border),
        Icon(Icons.chat_bubble_outline),
        Icon(Icons.replay_10_outlined),
      ],
    );
  }
}
