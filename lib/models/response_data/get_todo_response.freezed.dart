// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_todo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTodoResponse _$GetTodoResponseFromJson(Map<String, dynamic> json) {
  return _GetTodoResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTodoResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Todo get todo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTodoResponseCopyWith<GetTodoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTodoResponseCopyWith<$Res> {
  factory $GetTodoResponseCopyWith(
          GetTodoResponse value, $Res Function(GetTodoResponse) then) =
      _$GetTodoResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class _$GetTodoResponseCopyWithImpl<$Res>
    implements $GetTodoResponseCopyWith<$Res> {
  _$GetTodoResponseCopyWithImpl(this._value, this._then);

  final GetTodoResponse _value;
  // ignore: unused_field
  final $Res Function(GetTodoResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? todo = freezed,
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
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc
abstract class _$$_GetTodoResponseCopyWith<$Res>
    implements $GetTodoResponseCopyWith<$Res> {
  factory _$$_GetTodoResponseCopyWith(
          _$_GetTodoResponse value, $Res Function(_$_GetTodoResponse) then) =
      __$$_GetTodoResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, Todo todo});

  @override
  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$_GetTodoResponseCopyWithImpl<$Res>
    extends _$GetTodoResponseCopyWithImpl<$Res>
    implements _$$_GetTodoResponseCopyWith<$Res> {
  __$$_GetTodoResponseCopyWithImpl(
      _$_GetTodoResponse _value, $Res Function(_$_GetTodoResponse) _then)
      : super(_value, (v) => _then(v as _$_GetTodoResponse));

  @override
  _$_GetTodoResponse get _value => super._value as _$_GetTodoResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? todo = freezed,
  }) {
    return _then(_$_GetTodoResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetTodoResponse implements _GetTodoResponse {
  _$_GetTodoResponse(
      {this.success = true, this.message = '', required this.todo});

  factory _$_GetTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetTodoResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final Todo todo;

  @override
  String toString() {
    return 'GetTodoResponse(success: $success, message: $message, todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTodoResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.todo, todo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(todo));

  @JsonKey(ignore: true)
  @override
  _$$_GetTodoResponseCopyWith<_$_GetTodoResponse> get copyWith =>
      __$$_GetTodoResponseCopyWithImpl<_$_GetTodoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetTodoResponseToJson(
      this,
    );
  }
}

abstract class _GetTodoResponse implements GetTodoResponse {
  factory _GetTodoResponse(
      {final bool success,
      final String message,
      required final Todo todo}) = _$_GetTodoResponse;

  factory _GetTodoResponse.fromJson(Map<String, dynamic> json) =
      _$_GetTodoResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Todo get todo;
  @override
  @JsonKey(ignore: true)
  _$$_GetTodoResponseCopyWith<_$_GetTodoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
