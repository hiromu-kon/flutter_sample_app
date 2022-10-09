// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_posts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPostsResponse _$GetPostsResponseFromJson(Map<String, dynamic> json) {
  return _GetPostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPostsResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPostsResponseCopyWith<GetPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostsResponseCopyWith<$Res> {
  factory $GetPostsResponseCopyWith(
          GetPostsResponse value, $Res Function(GetPostsResponse) then) =
      _$GetPostsResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, List<Post> posts});
}

/// @nodoc
class _$GetPostsResponseCopyWithImpl<$Res>
    implements $GetPostsResponseCopyWith<$Res> {
  _$GetPostsResponseCopyWithImpl(this._value, this._then);

  final GetPostsResponse _value;
  // ignore: unused_field
  final $Res Function(GetPostsResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? posts = freezed,
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
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
abstract class _$$_GetPostsResponseCopyWith<$Res>
    implements $GetPostsResponseCopyWith<$Res> {
  factory _$$_GetPostsResponseCopyWith(
          _$_GetPostsResponse value, $Res Function(_$_GetPostsResponse) then) =
      __$$_GetPostsResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, List<Post> posts});
}

/// @nodoc
class __$$_GetPostsResponseCopyWithImpl<$Res>
    extends _$GetPostsResponseCopyWithImpl<$Res>
    implements _$$_GetPostsResponseCopyWith<$Res> {
  __$$_GetPostsResponseCopyWithImpl(
      _$_GetPostsResponse _value, $Res Function(_$_GetPostsResponse) _then)
      : super(_value, (v) => _then(v as _$_GetPostsResponse));

  @override
  _$_GetPostsResponse get _value => super._value as _$_GetPostsResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$_GetPostsResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      posts: posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetPostsResponse implements _GetPostsResponse {
  _$_GetPostsResponse(
      {this.success = true,
      this.message = '',
      final List<Post> posts = Post.defaultListValue})
      : _posts = posts;

  factory _$_GetPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetPostsResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  final List<Post> _posts;
  @override
  @JsonKey()
  List<Post> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'GetPostsResponse(success: $success, message: $message, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPostsResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  _$$_GetPostsResponseCopyWith<_$_GetPostsResponse> get copyWith =>
      __$$_GetPostsResponseCopyWithImpl<_$_GetPostsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetPostsResponseToJson(
      this,
    );
  }
}

abstract class _GetPostsResponse implements GetPostsResponse {
  factory _GetPostsResponse(
      {final bool success,
      final String message,
      final List<Post> posts}) = _$_GetPostsResponse;

  factory _GetPostsResponse.fromJson(Map<String, dynamic> json) =
      _$_GetPostsResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_GetPostsResponseCopyWith<_$_GetPostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
