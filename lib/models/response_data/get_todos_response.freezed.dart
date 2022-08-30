// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_todos_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTodosResponse _$GetTodosResponseFromJson(Map<String, dynamic> json) {
  return _GetTodosResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTodosResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Todo> get todos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTodosResponseCopyWith<GetTodosResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTodosResponseCopyWith<$Res> {
  factory $GetTodosResponseCopyWith(
          GetTodosResponse value, $Res Function(GetTodosResponse) then) =
      _$GetTodosResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, List<Todo> todos});
}

/// @nodoc
class _$GetTodosResponseCopyWithImpl<$Res>
    implements $GetTodosResponseCopyWith<$Res> {
  _$GetTodosResponseCopyWithImpl(this._value, this._then);

  final GetTodosResponse _value;
  // ignore: unused_field
  final $Res Function(GetTodosResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? todos = freezed,
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
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$$_GetTodosResponseCopyWith<$Res>
    implements $GetTodosResponseCopyWith<$Res> {
  factory _$$_GetTodosResponseCopyWith(
          _$_GetTodosResponse value, $Res Function(_$_GetTodosResponse) then) =
      __$$_GetTodosResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, List<Todo> todos});
}

/// @nodoc
class __$$_GetTodosResponseCopyWithImpl<$Res>
    extends _$GetTodosResponseCopyWithImpl<$Res>
    implements _$$_GetTodosResponseCopyWith<$Res> {
  __$$_GetTodosResponseCopyWithImpl(
      _$_GetTodosResponse _value, $Res Function(_$_GetTodosResponse) _then)
      : super(_value, (v) => _then(v as _$_GetTodosResponse));

  @override
  _$_GetTodosResponse get _value => super._value as _$_GetTodosResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? todos = freezed,
  }) {
    return _then(_$_GetTodosResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      todos: todos == freezed
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetTodosResponse implements _GetTodosResponse {
  _$_GetTodosResponse(
      {this.success = true,
      this.message = '',
      final List<Todo> todos = Todo.defaultListValue})
      : _todos = todos;

  factory _$_GetTodosResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetTodosResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'GetTodosResponse(success: $success, message: $message, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTodosResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  _$$_GetTodosResponseCopyWith<_$_GetTodosResponse> get copyWith =>
      __$$_GetTodosResponseCopyWithImpl<_$_GetTodosResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetTodosResponseToJson(
      this,
    );
  }
}

abstract class _GetTodosResponse implements GetTodosResponse {
  factory _GetTodosResponse(
      {final bool success,
      final String message,
      final List<Todo> todos}) = _$_GetTodosResponse;

  factory _GetTodosResponse.fromJson(Map<String, dynamic> json) =
      _$_GetTodosResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Todo> get todos;
  @override
  @JsonKey(ignore: true)
  _$$_GetTodosResponseCopyWith<_$_GetTodosResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
