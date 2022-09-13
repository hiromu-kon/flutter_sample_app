import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/app_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GeolocationSamplePage extends HookConsumerWidget {
  const GeolocationSamplePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GeolocationSamplePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geolocation = useGeolocation();
    return Scaffold(
      appBar: const CommonAppBar(title: 'Geolocation'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('-- Geolocation --'),
            Text('permission checked: ${geolocation.fetched}'),
            Text('location: ${geolocation.position}'),
            ElevatedButton(
              onPressed: () async {
                await Geolocator.requestPermission();
              },
              child: const Text('Grant Location permission'),
            ),
          ],
        ),
      ),
    );
  }
}
