// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_registry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultBinding {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConfirmResult field0) confirm,
    required TResult Function(ErrorResult field0) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConfirmResult field0)? confirm,
    TResult? Function(ErrorResult field0)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConfirmResult field0)? confirm,
    TResult Function(ErrorResult field0)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultBinding_Confirm value) confirm,
    required TResult Function(ResultBinding_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultBinding_Confirm value)? confirm,
    TResult? Function(ResultBinding_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultBinding_Confirm value)? confirm,
    TResult Function(ResultBinding_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultBindingCopyWith<$Res> {
  factory $ResultBindingCopyWith(
          ResultBinding value, $Res Function(ResultBinding) then) =
      _$ResultBindingCopyWithImpl<$Res, ResultBinding>;
}

/// @nodoc
class _$ResultBindingCopyWithImpl<$Res, $Val extends ResultBinding>
    implements $ResultBindingCopyWith<$Res> {
  _$ResultBindingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResultBinding_ConfirmImplCopyWith<$Res> {
  factory _$$ResultBinding_ConfirmImplCopyWith(
          _$ResultBinding_ConfirmImpl value,
          $Res Function(_$ResultBinding_ConfirmImpl) then) =
      __$$ResultBinding_ConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConfirmResult field0});
}

/// @nodoc
class __$$ResultBinding_ConfirmImplCopyWithImpl<$Res>
    extends _$ResultBindingCopyWithImpl<$Res, _$ResultBinding_ConfirmImpl>
    implements _$$ResultBinding_ConfirmImplCopyWith<$Res> {
  __$$ResultBinding_ConfirmImplCopyWithImpl(_$ResultBinding_ConfirmImpl _value,
      $Res Function(_$ResultBinding_ConfirmImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ResultBinding_ConfirmImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as ConfirmResult,
    ));
  }
}

/// @nodoc

class _$ResultBinding_ConfirmImpl implements ResultBinding_Confirm {
  const _$ResultBinding_ConfirmImpl(this.field0);

  @override
  final ConfirmResult field0;

  @override
  String toString() {
    return 'ResultBinding.confirm(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultBinding_ConfirmImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultBinding_ConfirmImplCopyWith<_$ResultBinding_ConfirmImpl>
      get copyWith => __$$ResultBinding_ConfirmImplCopyWithImpl<
          _$ResultBinding_ConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConfirmResult field0) confirm,
    required TResult Function(ErrorResult field0) error,
  }) {
    return confirm(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConfirmResult field0)? confirm,
    TResult? Function(ErrorResult field0)? error,
  }) {
    return confirm?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConfirmResult field0)? confirm,
    TResult Function(ErrorResult field0)? error,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultBinding_Confirm value) confirm,
    required TResult Function(ResultBinding_Error value) error,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultBinding_Confirm value)? confirm,
    TResult? Function(ResultBinding_Error value)? error,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultBinding_Confirm value)? confirm,
    TResult Function(ResultBinding_Error value)? error,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class ResultBinding_Confirm implements ResultBinding {
  const factory ResultBinding_Confirm(final ConfirmResult field0) =
      _$ResultBinding_ConfirmImpl;

  @override
  ConfirmResult get field0;
  @JsonKey(ignore: true)
  _$$ResultBinding_ConfirmImplCopyWith<_$ResultBinding_ConfirmImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultBinding_ErrorImplCopyWith<$Res> {
  factory _$$ResultBinding_ErrorImplCopyWith(_$ResultBinding_ErrorImpl value,
          $Res Function(_$ResultBinding_ErrorImpl) then) =
      __$$ResultBinding_ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorResult field0});
}

/// @nodoc
class __$$ResultBinding_ErrorImplCopyWithImpl<$Res>
    extends _$ResultBindingCopyWithImpl<$Res, _$ResultBinding_ErrorImpl>
    implements _$$ResultBinding_ErrorImplCopyWith<$Res> {
  __$$ResultBinding_ErrorImplCopyWithImpl(_$ResultBinding_ErrorImpl _value,
      $Res Function(_$ResultBinding_ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$ResultBinding_ErrorImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as ErrorResult,
    ));
  }
}

/// @nodoc

class _$ResultBinding_ErrorImpl implements ResultBinding_Error {
  const _$ResultBinding_ErrorImpl(this.field0);

  @override
  final ErrorResult field0;

  @override
  String toString() {
    return 'ResultBinding.error(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultBinding_ErrorImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultBinding_ErrorImplCopyWith<_$ResultBinding_ErrorImpl> get copyWith =>
      __$$ResultBinding_ErrorImplCopyWithImpl<_$ResultBinding_ErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConfirmResult field0) confirm,
    required TResult Function(ErrorResult field0) error,
  }) {
    return error(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConfirmResult field0)? confirm,
    TResult? Function(ErrorResult field0)? error,
  }) {
    return error?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConfirmResult field0)? confirm,
    TResult Function(ErrorResult field0)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultBinding_Confirm value) confirm,
    required TResult Function(ResultBinding_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultBinding_Confirm value)? confirm,
    TResult? Function(ResultBinding_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultBinding_Confirm value)? confirm,
    TResult Function(ResultBinding_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResultBinding_Error implements ResultBinding {
  const factory ResultBinding_Error(final ErrorResult field0) =
      _$ResultBinding_ErrorImpl;

  @override
  ErrorResult get field0;
  @JsonKey(ignore: true)
  _$$ResultBinding_ErrorImplCopyWith<_$ResultBinding_ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResultRegistry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool status) confirmResult,
    required TResult Function(String error) errorResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool status)? confirmResult,
    TResult? Function(String error)? errorResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool status)? confirmResult,
    TResult Function(String error)? errorResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultRegistry_ConfirmResult value) confirmResult,
    required TResult Function(ResultRegistry_ErrorResult value) errorResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult? Function(ResultRegistry_ErrorResult value)? errorResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult Function(ResultRegistry_ErrorResult value)? errorResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultRegistryCopyWith<$Res> {
  factory $ResultRegistryCopyWith(
          ResultRegistry value, $Res Function(ResultRegistry) then) =
      _$ResultRegistryCopyWithImpl<$Res, ResultRegistry>;
}

/// @nodoc
class _$ResultRegistryCopyWithImpl<$Res, $Val extends ResultRegistry>
    implements $ResultRegistryCopyWith<$Res> {
  _$ResultRegistryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResultRegistry_ConfirmResultImplCopyWith<$Res> {
  factory _$$ResultRegistry_ConfirmResultImplCopyWith(
          _$ResultRegistry_ConfirmResultImpl value,
          $Res Function(_$ResultRegistry_ConfirmResultImpl) then) =
      __$$ResultRegistry_ConfirmResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$ResultRegistry_ConfirmResultImplCopyWithImpl<$Res>
    extends _$ResultRegistryCopyWithImpl<$Res,
        _$ResultRegistry_ConfirmResultImpl>
    implements _$$ResultRegistry_ConfirmResultImplCopyWith<$Res> {
  __$$ResultRegistry_ConfirmResultImplCopyWithImpl(
      _$ResultRegistry_ConfirmResultImpl _value,
      $Res Function(_$ResultRegistry_ConfirmResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ResultRegistry_ConfirmResultImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResultRegistry_ConfirmResultImpl
    implements ResultRegistry_ConfirmResult {
  const _$ResultRegistry_ConfirmResultImpl({required this.status});

  @override
  final bool status;

  @override
  String toString() {
    return 'ResultRegistry.confirmResult(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultRegistry_ConfirmResultImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultRegistry_ConfirmResultImplCopyWith<
          _$ResultRegistry_ConfirmResultImpl>
      get copyWith => __$$ResultRegistry_ConfirmResultImplCopyWithImpl<
          _$ResultRegistry_ConfirmResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool status) confirmResult,
    required TResult Function(String error) errorResult,
  }) {
    return confirmResult(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool status)? confirmResult,
    TResult? Function(String error)? errorResult,
  }) {
    return confirmResult?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool status)? confirmResult,
    TResult Function(String error)? errorResult,
    required TResult orElse(),
  }) {
    if (confirmResult != null) {
      return confirmResult(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultRegistry_ConfirmResult value) confirmResult,
    required TResult Function(ResultRegistry_ErrorResult value) errorResult,
  }) {
    return confirmResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult? Function(ResultRegistry_ErrorResult value)? errorResult,
  }) {
    return confirmResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult Function(ResultRegistry_ErrorResult value)? errorResult,
    required TResult orElse(),
  }) {
    if (confirmResult != null) {
      return confirmResult(this);
    }
    return orElse();
  }
}

abstract class ResultRegistry_ConfirmResult implements ResultRegistry {
  const factory ResultRegistry_ConfirmResult({required final bool status}) =
      _$ResultRegistry_ConfirmResultImpl;

  bool get status;
  @JsonKey(ignore: true)
  _$$ResultRegistry_ConfirmResultImplCopyWith<
          _$ResultRegistry_ConfirmResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultRegistry_ErrorResultImplCopyWith<$Res> {
  factory _$$ResultRegistry_ErrorResultImplCopyWith(
          _$ResultRegistry_ErrorResultImpl value,
          $Res Function(_$ResultRegistry_ErrorResultImpl) then) =
      __$$ResultRegistry_ErrorResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ResultRegistry_ErrorResultImplCopyWithImpl<$Res>
    extends _$ResultRegistryCopyWithImpl<$Res, _$ResultRegistry_ErrorResultImpl>
    implements _$$ResultRegistry_ErrorResultImplCopyWith<$Res> {
  __$$ResultRegistry_ErrorResultImplCopyWithImpl(
      _$ResultRegistry_ErrorResultImpl _value,
      $Res Function(_$ResultRegistry_ErrorResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResultRegistry_ErrorResultImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResultRegistry_ErrorResultImpl implements ResultRegistry_ErrorResult {
  const _$ResultRegistry_ErrorResultImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ResultRegistry.errorResult(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultRegistry_ErrorResultImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultRegistry_ErrorResultImplCopyWith<_$ResultRegistry_ErrorResultImpl>
      get copyWith => __$$ResultRegistry_ErrorResultImplCopyWithImpl<
          _$ResultRegistry_ErrorResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool status) confirmResult,
    required TResult Function(String error) errorResult,
  }) {
    return errorResult(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool status)? confirmResult,
    TResult? Function(String error)? errorResult,
  }) {
    return errorResult?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool status)? confirmResult,
    TResult Function(String error)? errorResult,
    required TResult orElse(),
  }) {
    if (errorResult != null) {
      return errorResult(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultRegistry_ConfirmResult value) confirmResult,
    required TResult Function(ResultRegistry_ErrorResult value) errorResult,
  }) {
    return errorResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult? Function(ResultRegistry_ErrorResult value)? errorResult,
  }) {
    return errorResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultRegistry_ConfirmResult value)? confirmResult,
    TResult Function(ResultRegistry_ErrorResult value)? errorResult,
    required TResult orElse(),
  }) {
    if (errorResult != null) {
      return errorResult(this);
    }
    return orElse();
  }
}

abstract class ResultRegistry_ErrorResult implements ResultRegistry {
  const factory ResultRegistry_ErrorResult({required final String error}) =
      _$ResultRegistry_ErrorResultImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ResultRegistry_ErrorResultImplCopyWith<_$ResultRegistry_ErrorResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WidgetRegistry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WidgetRegistryCopyWith<$Res> {
  factory $WidgetRegistryCopyWith(
          WidgetRegistry value, $Res Function(WidgetRegistry) then) =
      _$WidgetRegistryCopyWithImpl<$Res, WidgetRegistry>;
}

/// @nodoc
class _$WidgetRegistryCopyWithImpl<$Res, $Val extends WidgetRegistry>
    implements $WidgetRegistryCopyWith<$Res> {
  _$WidgetRegistryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WidgetRegistry_ClickButtonImplCopyWith<$Res> {
  factory _$$WidgetRegistry_ClickButtonImplCopyWith(
          _$WidgetRegistry_ClickButtonImpl value,
          $Res Function(_$WidgetRegistry_ClickButtonImpl) then) =
      __$$WidgetRegistry_ClickButtonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WidgetRegistry_ClickButtonImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res, _$WidgetRegistry_ClickButtonImpl>
    implements _$$WidgetRegistry_ClickButtonImplCopyWith<$Res> {
  __$$WidgetRegistry_ClickButtonImplCopyWithImpl(
      _$WidgetRegistry_ClickButtonImpl _value,
      $Res Function(_$WidgetRegistry_ClickButtonImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WidgetRegistry_ClickButtonImpl implements WidgetRegistry_ClickButton {
  const _$WidgetRegistry_ClickButtonImpl();

  @override
  String toString() {
    return 'WidgetRegistry.clickButton()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_ClickButtonImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return clickButton();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return clickButton?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (clickButton != null) {
      return clickButton();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return clickButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return clickButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (clickButton != null) {
      return clickButton(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_ClickButton implements WidgetRegistry {
  const factory WidgetRegistry_ClickButton() = _$WidgetRegistry_ClickButtonImpl;
}

/// @nodoc
abstract class _$$WidgetRegistry_ToggleButtonImplCopyWith<$Res> {
  factory _$$WidgetRegistry_ToggleButtonImplCopyWith(
          _$WidgetRegistry_ToggleButtonImpl value,
          $Res Function(_$WidgetRegistry_ToggleButtonImpl) then) =
      __$$WidgetRegistry_ToggleButtonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$WidgetRegistry_ToggleButtonImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res,
        _$WidgetRegistry_ToggleButtonImpl>
    implements _$$WidgetRegistry_ToggleButtonImplCopyWith<$Res> {
  __$$WidgetRegistry_ToggleButtonImplCopyWithImpl(
      _$WidgetRegistry_ToggleButtonImpl _value,
      $Res Function(_$WidgetRegistry_ToggleButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$WidgetRegistry_ToggleButtonImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WidgetRegistry_ToggleButtonImpl implements WidgetRegistry_ToggleButton {
  const _$WidgetRegistry_ToggleButtonImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'WidgetRegistry.toggleButton(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_ToggleButtonImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetRegistry_ToggleButtonImplCopyWith<_$WidgetRegistry_ToggleButtonImpl>
      get copyWith => __$$WidgetRegistry_ToggleButtonImplCopyWithImpl<
          _$WidgetRegistry_ToggleButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return toggleButton(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return toggleButton?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (toggleButton != null) {
      return toggleButton(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return toggleButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return toggleButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (toggleButton != null) {
      return toggleButton(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_ToggleButton implements WidgetRegistry {
  const factory WidgetRegistry_ToggleButton({required final bool value}) =
      _$WidgetRegistry_ToggleButtonImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$WidgetRegistry_ToggleButtonImplCopyWith<_$WidgetRegistry_ToggleButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WidgetRegistry_ConfirmButtonImplCopyWith<$Res> {
  factory _$$WidgetRegistry_ConfirmButtonImplCopyWith(
          _$WidgetRegistry_ConfirmButtonImpl value,
          $Res Function(_$WidgetRegistry_ConfirmButtonImpl) then) =
      __$$WidgetRegistry_ConfirmButtonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WidgetRegistry_ConfirmButtonImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res,
        _$WidgetRegistry_ConfirmButtonImpl>
    implements _$$WidgetRegistry_ConfirmButtonImplCopyWith<$Res> {
  __$$WidgetRegistry_ConfirmButtonImplCopyWithImpl(
      _$WidgetRegistry_ConfirmButtonImpl _value,
      $Res Function(_$WidgetRegistry_ConfirmButtonImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WidgetRegistry_ConfirmButtonImpl
    implements WidgetRegistry_ConfirmButton {
  const _$WidgetRegistry_ConfirmButtonImpl();

  @override
  String toString() {
    return 'WidgetRegistry.confirmButton()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_ConfirmButtonImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return confirmButton();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return confirmButton?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (confirmButton != null) {
      return confirmButton();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return confirmButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return confirmButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (confirmButton != null) {
      return confirmButton(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_ConfirmButton implements WidgetRegistry {
  const factory WidgetRegistry_ConfirmButton() =
      _$WidgetRegistry_ConfirmButtonImpl;
}

/// @nodoc
abstract class _$$WidgetRegistry_PressButtonImplCopyWith<$Res> {
  factory _$$WidgetRegistry_PressButtonImplCopyWith(
          _$WidgetRegistry_PressButtonImpl value,
          $Res Function(_$WidgetRegistry_PressButtonImpl) then) =
      __$$WidgetRegistry_PressButtonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool pressed});
}

/// @nodoc
class __$$WidgetRegistry_PressButtonImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res, _$WidgetRegistry_PressButtonImpl>
    implements _$$WidgetRegistry_PressButtonImplCopyWith<$Res> {
  __$$WidgetRegistry_PressButtonImplCopyWithImpl(
      _$WidgetRegistry_PressButtonImpl _value,
      $Res Function(_$WidgetRegistry_PressButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pressed = null,
  }) {
    return _then(_$WidgetRegistry_PressButtonImpl(
      pressed: null == pressed
          ? _value.pressed
          : pressed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WidgetRegistry_PressButtonImpl implements WidgetRegistry_PressButton {
  const _$WidgetRegistry_PressButtonImpl({required this.pressed});

  @override
  final bool pressed;

  @override
  String toString() {
    return 'WidgetRegistry.pressButton(pressed: $pressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_PressButtonImpl &&
            (identical(other.pressed, pressed) || other.pressed == pressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetRegistry_PressButtonImplCopyWith<_$WidgetRegistry_PressButtonImpl>
      get copyWith => __$$WidgetRegistry_PressButtonImplCopyWithImpl<
          _$WidgetRegistry_PressButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return pressButton(pressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return pressButton?.call(pressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (pressButton != null) {
      return pressButton(pressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return pressButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return pressButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (pressButton != null) {
      return pressButton(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_PressButton implements WidgetRegistry {
  const factory WidgetRegistry_PressButton({required final bool pressed}) =
      _$WidgetRegistry_PressButtonImpl;

  bool get pressed;
  @JsonKey(ignore: true)
  _$$WidgetRegistry_PressButtonImplCopyWith<_$WidgetRegistry_PressButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WidgetRegistry_DirectionalButtonImplCopyWith<$Res> {
  factory _$$WidgetRegistry_DirectionalButtonImplCopyWith(
          _$WidgetRegistry_DirectionalButtonImpl value,
          $Res Function(_$WidgetRegistry_DirectionalButtonImpl) then) =
      __$$WidgetRegistry_DirectionalButtonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int direction});
}

/// @nodoc
class __$$WidgetRegistry_DirectionalButtonImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res,
        _$WidgetRegistry_DirectionalButtonImpl>
    implements _$$WidgetRegistry_DirectionalButtonImplCopyWith<$Res> {
  __$$WidgetRegistry_DirectionalButtonImplCopyWithImpl(
      _$WidgetRegistry_DirectionalButtonImpl _value,
      $Res Function(_$WidgetRegistry_DirectionalButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_$WidgetRegistry_DirectionalButtonImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WidgetRegistry_DirectionalButtonImpl
    implements WidgetRegistry_DirectionalButton {
  const _$WidgetRegistry_DirectionalButtonImpl({required this.direction});

  @override
  final int direction;

  @override
  String toString() {
    return 'WidgetRegistry.directionalButton(direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_DirectionalButtonImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetRegistry_DirectionalButtonImplCopyWith<
          _$WidgetRegistry_DirectionalButtonImpl>
      get copyWith => __$$WidgetRegistry_DirectionalButtonImplCopyWithImpl<
          _$WidgetRegistry_DirectionalButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return directionalButton(direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return directionalButton?.call(direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (directionalButton != null) {
      return directionalButton(direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return directionalButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return directionalButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (directionalButton != null) {
      return directionalButton(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_DirectionalButton implements WidgetRegistry {
  const factory WidgetRegistry_DirectionalButton(
      {required final int direction}) = _$WidgetRegistry_DirectionalButtonImpl;

  int get direction;
  @JsonKey(ignore: true)
  _$$WidgetRegistry_DirectionalButtonImplCopyWith<
          _$WidgetRegistry_DirectionalButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WidgetRegistry_JoystickImplCopyWith<$Res> {
  factory _$$WidgetRegistry_JoystickImplCopyWith(
          _$WidgetRegistry_JoystickImpl value,
          $Res Function(_$WidgetRegistry_JoystickImpl) then) =
      __$$WidgetRegistry_JoystickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Coord delta, double intensity});
}

/// @nodoc
class __$$WidgetRegistry_JoystickImplCopyWithImpl<$Res>
    extends _$WidgetRegistryCopyWithImpl<$Res, _$WidgetRegistry_JoystickImpl>
    implements _$$WidgetRegistry_JoystickImplCopyWith<$Res> {
  __$$WidgetRegistry_JoystickImplCopyWithImpl(
      _$WidgetRegistry_JoystickImpl _value,
      $Res Function(_$WidgetRegistry_JoystickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? intensity = null,
  }) {
    return _then(_$WidgetRegistry_JoystickImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Coord,
      intensity: null == intensity
          ? _value.intensity
          : intensity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$WidgetRegistry_JoystickImpl implements WidgetRegistry_Joystick {
  const _$WidgetRegistry_JoystickImpl(
      {required this.delta, required this.intensity});

  @override
  final Coord delta;
  @override
  final double intensity;

  @override
  String toString() {
    return 'WidgetRegistry.joystick(delta: $delta, intensity: $intensity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetRegistry_JoystickImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delta, intensity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetRegistry_JoystickImplCopyWith<_$WidgetRegistry_JoystickImpl>
      get copyWith => __$$WidgetRegistry_JoystickImplCopyWithImpl<
          _$WidgetRegistry_JoystickImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
    required TResult Function(bool pressed) pressButton,
    required TResult Function(int direction) directionalButton,
    required TResult Function(Coord delta, double intensity) joystick,
  }) {
    return joystick(delta, intensity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
    TResult? Function(bool pressed)? pressButton,
    TResult? Function(int direction)? directionalButton,
    TResult? Function(Coord delta, double intensity)? joystick,
  }) {
    return joystick?.call(delta, intensity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    TResult Function(bool pressed)? pressButton,
    TResult Function(int direction)? directionalButton,
    TResult Function(Coord delta, double intensity)? joystick,
    required TResult orElse(),
  }) {
    if (joystick != null) {
      return joystick(delta, intensity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
    required TResult Function(WidgetRegistry_PressButton value) pressButton,
    required TResult Function(WidgetRegistry_DirectionalButton value)
        directionalButton,
    required TResult Function(WidgetRegistry_Joystick value) joystick,
  }) {
    return joystick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult? Function(WidgetRegistry_PressButton value)? pressButton,
    TResult? Function(WidgetRegistry_DirectionalButton value)?
        directionalButton,
    TResult? Function(WidgetRegistry_Joystick value)? joystick,
  }) {
    return joystick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
    TResult Function(WidgetRegistry_PressButton value)? pressButton,
    TResult Function(WidgetRegistry_DirectionalButton value)? directionalButton,
    TResult Function(WidgetRegistry_Joystick value)? joystick,
    required TResult orElse(),
  }) {
    if (joystick != null) {
      return joystick(this);
    }
    return orElse();
  }
}

abstract class WidgetRegistry_Joystick implements WidgetRegistry {
  const factory WidgetRegistry_Joystick(
      {required final Coord delta,
      required final double intensity}) = _$WidgetRegistry_JoystickImpl;

  Coord get delta;
  double get intensity;
  @JsonKey(ignore: true)
  _$$WidgetRegistry_JoystickImplCopyWith<_$WidgetRegistry_JoystickImpl>
      get copyWith => throw _privateConstructorUsedError;
}
