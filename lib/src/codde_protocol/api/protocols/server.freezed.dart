// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerProtocol {
  T get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T field0) socket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T field0)? socket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T field0)? socket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerProtocol_Socket value) socket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerProtocol_Socket value)? socket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerProtocol_Socket value)? socket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerProtocolCopyWith<ServerProtocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerProtocolCopyWith<$Res> {
  factory $ServerProtocolCopyWith(
          ServerProtocol value, $Res Function(ServerProtocol) then) =
      _$ServerProtocolCopyWithImpl<$Res, ServerProtocol>;
  @useResult
  $Res call({T field0});
}

/// @nodoc
class _$ServerProtocolCopyWithImpl<$Res, $Val extends ServerProtocol>
    implements $ServerProtocolCopyWith<$Res> {
  _$ServerProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_value.copyWith(
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerProtocol_SocketImplCopyWith<$Res>
    implements $ServerProtocolCopyWith<$Res> {
  factory _$$ServerProtocol_SocketImplCopyWith(
          _$ServerProtocol_SocketImpl value,
          $Res Function(_$ServerProtocol_SocketImpl) then) =
      __$$ServerProtocol_SocketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({T field0});
}

/// @nodoc
class __$$ServerProtocol_SocketImplCopyWithImpl<$Res>
    extends _$ServerProtocolCopyWithImpl<$Res, _$ServerProtocol_SocketImpl>
    implements _$$ServerProtocol_SocketImplCopyWith<$Res> {
  __$$ServerProtocol_SocketImplCopyWithImpl(_$ServerProtocol_SocketImpl _value,
      $Res Function(_$ServerProtocol_SocketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ServerProtocol_SocketImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ServerProtocol_SocketImpl implements ServerProtocol_Socket {
  const _$ServerProtocol_SocketImpl(this.field0);

  @override
  final T field0;

  @override
  String toString() {
    return 'ServerProtocol.socket(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerProtocol_SocketImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerProtocol_SocketImplCopyWith<_$ServerProtocol_SocketImpl>
      get copyWith => __$$ServerProtocol_SocketImplCopyWithImpl<
          _$ServerProtocol_SocketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T field0) socket,
  }) {
    return socket(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T field0)? socket,
  }) {
    return socket?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T field0)? socket,
    required TResult orElse(),
  }) {
    if (socket != null) {
      return socket(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerProtocol_Socket value) socket,
  }) {
    return socket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerProtocol_Socket value)? socket,
  }) {
    return socket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerProtocol_Socket value)? socket,
    required TResult orElse(),
  }) {
    if (socket != null) {
      return socket(this);
    }
    return orElse();
  }
}

abstract class ServerProtocol_Socket implements ServerProtocol {
  const factory ServerProtocol_Socket(final T field0) =
      _$ServerProtocol_SocketImpl;

  @override
  T get field0;
  @override
  @JsonKey(ignore: true)
  _$$ServerProtocol_SocketImplCopyWith<_$ServerProtocol_SocketImpl>
      get copyWith => throw _privateConstructorUsedError;
}
