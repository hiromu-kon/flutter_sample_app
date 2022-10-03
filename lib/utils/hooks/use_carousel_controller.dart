import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

CarouselController useCarouselController() {
  return useState(CarouselController()).value;
}
