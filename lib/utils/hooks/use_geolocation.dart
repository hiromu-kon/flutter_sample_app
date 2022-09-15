import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';

GeolocationState useGeolocation({
  LocationSettings? locationSettings,
}) {
  final state = useRef(const GeolocationState());
  final positionChanged = useStream(
    useMemoized(
      () => Geolocator.getPositionStream(locationSettings: locationSettings),
    ),
  );

  // ignore: join_return_with_assignment
  state.value = GeolocationState(
    fetched: positionChanged.hasData,
    position: positionChanged.data,
  );

  return state.value;
}

@immutable
class GeolocationState {
  const GeolocationState({
    this.fetched = false,
    this.position,
  });

  final bool fetched;
  final Position? position;
}
