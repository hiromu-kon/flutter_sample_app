// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPostResponse _$GetPostResponseFromJson(Map<String, dynamic> json) {
  return _GetPostResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPostResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Post get post => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostResponseCopyWith<GetPostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostResponseCopyWith<$Res> {
  factory $GetPostResponseCopyWith(
          GetPostResponse value, $Res Function(GetPostResponse) then) =
      _$GetPostResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, Post post});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class _$GetPostResponseCopyWithImpl<$Res>
    implements $GetPostResponseCopyWith<$Res> {
  _$GetPostResponseCopyWithImpl(this._value, this._then);

  final GetPostResponse _value;
  // ignore: unused_field
  final $Res Function(GetPostResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? post = freezed,
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
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }

  @override
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc
abstract class _$$_GetPostResponseCopyWith<$Res>
    implements $GetPostResponseCopyWith<$Res> {
  factory _$$_GetPostResponseCopyWith(
          _$_GetPostResponse value, $Res Function(_$_GetPostResponse) then) =
      __$$_GetPostResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, Post post});

  @override
  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$_GetPostResponseCopyWithImpl<$Res>
    extends _$GetPostResponseCopyWithImpl<$Res>
    implements _$$_GetPostResponseCopyWith<$Res> {
  __$$_GetPostResponseCopyWithImpl(
      _$_GetPostResponse _value, $Res Function(_$_GetPostResponse) _then)
      : super(_value, (v) => _then(v as _$_GetPostResponse));

  @override
  _$_GetPostResponse get _value => super._value as _$_GetPostResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? post = freezed,
  }) {
    return _then(_$_GetPostResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetPostResponse implements _GetPostResponse {
  _$_GetPostResponse(
      {this.success = true, this.message = '', required this.post});

  factory _$_GetPostResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetPostResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final Post post;

  @override
  String toString() {
    return 'GetPostResponse(success: $success, message: $message, post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPostResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.post, post));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(post));

  @JsonKey(ignore: true)
  @override
  _$$_GetPostResponseCopyWith<_$_GetPostResponse> get copyWith =>
      __$$_GetPostResponseCopyWithImpl<_$_GetPostResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetPostResponseToJson(
      this,
    );
  }
}

abstract class _GetPostResponse implements GetPostResponse {
  factory _GetPostResponse(
      {final bool success,
      final String message,
      required final Post post}) = _$_GetPostResponse;

  factory _GetPostResponse.fromJson(Map<String, dynamic> json) =
      _$_GetPostResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Post get post;
  @override
  @JsonKey(ignore: true)
  _$$_GetPostResponseCopyWith<_$_GetPostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
