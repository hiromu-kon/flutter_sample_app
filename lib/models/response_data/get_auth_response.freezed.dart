// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAuthResponse _$GetAuthResponseFromJson(Map<String, dynamic> json) {
  return _GetAuthResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAuthResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Auth get authData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAuthResponseCopyWith<GetAuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAuthResponseCopyWith<$Res> {
  factory $GetAuthResponseCopyWith(
          GetAuthResponse value, $Res Function(GetAuthResponse) then) =
      _$GetAuthResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, Auth authData});

  $AuthCopyWith<$Res> get authData;
}

/// @nodoc
class _$GetAuthResponseCopyWithImpl<$Res>
    implements $GetAuthResponseCopyWith<$Res> {
  _$GetAuthResponseCopyWithImpl(this._value, this._then);

  final GetAuthResponse _value;
  // ignore: unused_field
  final $Res Function(GetAuthResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? authData = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      authData: authData == freezed
          ? _value.authData
          : authData // ignore: cast_nullable_to_non_nullable
              as Auth,
    ));
  }

  @override
  $AuthCopyWith<$Res> get authData {
    return $AuthCopyWith<$Res>(_value.authData, (value) {
      return _then(_value.copyWith(authData: value));
    });
  }
}

/// @nodoc
abstract class _$$_GetAuthResponseCopyWith<$Res>
    implements $GetAuthResponseCopyWith<$Res> {
  factory _$$_GetAuthResponseCopyWith(
          _$_GetAuthResponse value, $Res Function(_$_GetAuthResponse) then) =
      __$$_GetAuthResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, Auth authData});

  @override
  $AuthCopyWith<$Res> get authData;
}

/// @nodoc
class __$$_GetAuthResponseCopyWithImpl<$Res>
    extends _$GetAuthResponseCopyWithImpl<$Res>
    implements _$$_GetAuthResponseCopyWith<$Res> {
  __$$_GetAuthResponseCopyWithImpl(
      _$_GetAuthResponse _value, $Res Function(_$_GetAuthResponse) _then)
      : super(_value, (v) => _then(v as _$_GetAuthResponse));

  @override
  _$_GetAuthResponse get _value => super._value as _$_GetAuthResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? authData = freezed,
  }) {
    return _then(_$_GetAuthResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      authData: authData == freezed
          ? _value.authData
          : authData // ignore: cast_nullable_to_non_nullable
              as Auth,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetAuthResponse implements _GetAuthResponse {
  _$_GetAuthResponse(
      {this.success = true,
      this.message = '',
      this.authData = Auth.defaultValue});

  factory _$_GetAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetAuthResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final Auth authData;

  @override
  String toString() {
    return 'GetAuthResponse(success: $success, message: $message, authData: $authData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAuthResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.authData, authData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(authData));

  @JsonKey(ignore: true)
  @override
  _$$_GetAuthResponseCopyWith<_$_GetAuthResponse> get copyWith =>
      __$$_GetAuthResponseCopyWithImpl<_$_GetAuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetAuthResponseToJson(
      this,
    );
  }
}

abstract class _GetAuthResponse implements GetAuthResponse {
  factory _GetAuthResponse(
      {final bool success,
      final String message,
      final Auth authData}) = _$_GetAuthResponse;

  factory _GetAuthResponse.fromJson(Map<String, dynamic> json) =
      _$_GetAuthResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Auth get authData;
  @override
  @JsonKey(ignore: true)
  _$$_GetAuthResponseCopyWith<_$_GetAuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
