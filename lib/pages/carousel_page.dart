import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample_app/utils/hooks/hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends HookConsumerWidget {
  const CarouselPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CarouselPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlImages = <String>[
      'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80',
      'https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    ];

    final imageSliderActiveIndex = useState(0);
    final activeIndex = useState(0);
    final controller = useCarouselController();
    final carouselController = useCarouselController();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: controller,
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Center(
                            child: Text(
                              'text $i',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(height: 200),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.previousPage,
                      child: const Text('<'),
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: controller.nextPage,
                      child: const Text('>'),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(20),
          Stack(
            children: [
              CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) => Image.network(
                  urlImages[index],
                  fit: BoxFit.cover,
                ),
                options: CarouselOptions(
                  height: 200,
                  onPageChanged: (index, reason) =>
                      imageSliderActiveIndex.value = index,
                ),
              ),
              Positioned(
                bottom: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: urlImages
                      .asMap()
                      .entries
                      .map(
                        (map) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: imageSliderActiveIndex.value == map.key
                                ? Colors.white
                                : Colors.white.withOpacity(0.3),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const Gap(20),
          Center(
            child: Column(
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) => Container(
                    // アイテム間のmarginを調整する
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.grey,
                    child: Image.network(
                      urlImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  options: CarouselOptions(
                    height: 400,

                    // 自動でスクロールされる
                    autoPlay: true,

                    // 自動スクロールの時間を指定
                    autoPlayInterval: const Duration(seconds: 2),

                    // 左から流れるようになる
                    reverse: true,

                    // 画像を全幅で表示できる
                    // viewportFraction: 1,

                    // 左右の画像を小さくできる
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,

                    onPageChanged: (index, reason) => activeIndex.value = index,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex.value,
                  count: urlImages.length,
                  // effect: const JumpingDotEffect(
                  //   dotWidth: 20,
                  //   dotHeight: 20,
                  // ),
                  onDotClicked: carouselController.animateToPage,
                  effect: const SlideEffect(
                    dotWidth: 20,
                    dotHeight: 20,
                  ),
                )
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
