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
mixin _$Action {
  RustOpaque get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FnSWidgetRegistryResult field0) rustFn,
    required TResult Function(PyPyAny field0) pythonFn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult? Function(PyPyAny field0)? pythonFn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult Function(PyPyAny field0)? pythonFn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Action_RustFn value) rustFn,
    required TResult Function(Action_PythonFn value) pythonFn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Action_RustFn value)? rustFn,
    TResult? Function(Action_PythonFn value)? pythonFn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Action_RustFn value)? rustFn,
    TResult Function(Action_PythonFn value)? pythonFn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCopyWith<$Res> {
  factory $ActionCopyWith(Action value, $Res Function(Action) then) =
      _$ActionCopyWithImpl<$Res, Action>;
}

/// @nodoc
class _$ActionCopyWithImpl<$Res, $Val extends Action>
    implements $ActionCopyWith<$Res> {
  _$ActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Action_RustFnImplCopyWith<$Res> {
  factory _$$Action_RustFnImplCopyWith(
          _$Action_RustFnImpl value, $Res Function(_$Action_RustFnImpl) then) =
      __$$Action_RustFnImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FnSWidgetRegistryResult field0});
}

/// @nodoc
class __$$Action_RustFnImplCopyWithImpl<$Res>
    extends _$ActionCopyWithImpl<$Res, _$Action_RustFnImpl>
    implements _$$Action_RustFnImplCopyWith<$Res> {
  __$$Action_RustFnImplCopyWithImpl(
      _$Action_RustFnImpl _value, $Res Function(_$Action_RustFnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$Action_RustFnImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as FnSWidgetRegistryResult,
    ));
  }
}

/// @nodoc

class _$Action_RustFnImpl implements Action_RustFn {
  const _$Action_RustFnImpl(this.field0);

  @override
  final FnSWidgetRegistryResult field0;

  @override
  String toString() {
    return 'Action.rustFn(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Action_RustFnImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Action_RustFnImplCopyWith<_$Action_RustFnImpl> get copyWith =>
      __$$Action_RustFnImplCopyWithImpl<_$Action_RustFnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FnSWidgetRegistryResult field0) rustFn,
    required TResult Function(PyPyAny field0) pythonFn,
  }) {
    return rustFn(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult? Function(PyPyAny field0)? pythonFn,
  }) {
    return rustFn?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult Function(PyPyAny field0)? pythonFn,
    required TResult orElse(),
  }) {
    if (rustFn != null) {
      return rustFn(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Action_RustFn value) rustFn,
    required TResult Function(Action_PythonFn value) pythonFn,
  }) {
    return rustFn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Action_RustFn value)? rustFn,
    TResult? Function(Action_PythonFn value)? pythonFn,
  }) {
    return rustFn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Action_RustFn value)? rustFn,
    TResult Function(Action_PythonFn value)? pythonFn,
    required TResult orElse(),
  }) {
    if (rustFn != null) {
      return rustFn(this);
    }
    return orElse();
  }
}

abstract class Action_RustFn implements Action {
  const factory Action_RustFn(final FnSWidgetRegistryResult field0) =
      _$Action_RustFnImpl;

  @override
  FnSWidgetRegistryResult get field0;
  @JsonKey(ignore: true)
  _$$Action_RustFnImplCopyWith<_$Action_RustFnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Action_PythonFnImplCopyWith<$Res> {
  factory _$$Action_PythonFnImplCopyWith(_$Action_PythonFnImpl value,
          $Res Function(_$Action_PythonFnImpl) then) =
      __$$Action_PythonFnImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PyPyAny field0});
}

/// @nodoc
class __$$Action_PythonFnImplCopyWithImpl<$Res>
    extends _$ActionCopyWithImpl<$Res, _$Action_PythonFnImpl>
    implements _$$Action_PythonFnImplCopyWith<$Res> {
  __$$Action_PythonFnImplCopyWithImpl(
      _$Action_PythonFnImpl _value, $Res Function(_$Action_PythonFnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$Action_PythonFnImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PyPyAny,
    ));
  }
}

/// @nodoc

class _$Action_PythonFnImpl implements Action_PythonFn {
  const _$Action_PythonFnImpl(this.field0);

  @override
  final PyPyAny field0;

  @override
  String toString() {
    return 'Action.pythonFn(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Action_PythonFnImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Action_PythonFnImplCopyWith<_$Action_PythonFnImpl> get copyWith =>
      __$$Action_PythonFnImplCopyWithImpl<_$Action_PythonFnImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FnSWidgetRegistryResult field0) rustFn,
    required TResult Function(PyPyAny field0) pythonFn,
  }) {
    return pythonFn(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult? Function(PyPyAny field0)? pythonFn,
  }) {
    return pythonFn?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FnSWidgetRegistryResult field0)? rustFn,
    TResult Function(PyPyAny field0)? pythonFn,
    required TResult orElse(),
  }) {
    if (pythonFn != null) {
      return pythonFn(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Action_RustFn value) rustFn,
    required TResult Function(Action_PythonFn value) pythonFn,
  }) {
    return pythonFn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Action_RustFn value)? rustFn,
    TResult? Function(Action_PythonFn value)? pythonFn,
  }) {
    return pythonFn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Action_RustFn value)? rustFn,
    TResult Function(Action_PythonFn value)? pythonFn,
    required TResult orElse(),
  }) {
    if (pythonFn != null) {
      return pythonFn(this);
    }
    return orElse();
  }
}

abstract class Action_PythonFn implements Action {
  const factory Action_PythonFn(final PyPyAny field0) = _$Action_PythonFnImpl;

  @override
  PyPyAny get field0;
  @JsonKey(ignore: true)
  _$$Action_PythonFnImplCopyWith<_$Action_PythonFnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResultBinding {
  ConfirmResult get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConfirmResult field0) confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConfirmResult field0)? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConfirmResult field0)? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultBinding_Confirm value) confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultBinding_Confirm value)? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultBinding_Confirm value)? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultBindingCopyWith<ResultBinding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultBindingCopyWith<$Res> {
  factory $ResultBindingCopyWith(
          ResultBinding value, $Res Function(ResultBinding) then) =
      _$ResultBindingCopyWithImpl<$Res, ResultBinding>;
  @useResult
  $Res call({ConfirmResult field0});
}

/// @nodoc
class _$ResultBindingCopyWithImpl<$Res, $Val extends ResultBinding>
    implements $ResultBindingCopyWith<$Res> {
  _$ResultBindingCopyWithImpl(this._value, this._then);

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
              as ConfirmResult,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultBinding_ConfirmImplCopyWith<$Res>
    implements $ResultBindingCopyWith<$Res> {
  factory _$$ResultBinding_ConfirmImplCopyWith(
          _$ResultBinding_ConfirmImpl value,
          $Res Function(_$ResultBinding_ConfirmImpl) then) =
      __$$ResultBinding_ConfirmImplCopyWithImpl<$Res>;
  @override
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
  }) {
    return confirm(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConfirmResult field0)? confirm,
  }) {
    return confirm?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConfirmResult field0)? confirm,
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
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultBinding_Confirm value)? confirm,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultBinding_Confirm value)? confirm,
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
  @override
  @JsonKey(ignore: true)
  _$$ResultBinding_ConfirmImplCopyWith<_$ResultBinding_ConfirmImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResultRegistry {
  bool get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool status) confirmResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool status)? confirmResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool status)? confirmResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultRegistry_ConfirmResult value) confirmResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultRegistry_ConfirmResult value)? confirmResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultRegistry_ConfirmResult value)? confirmResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultRegistryCopyWith<ResultRegistry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultRegistryCopyWith<$Res> {
  factory $ResultRegistryCopyWith(
          ResultRegistry value, $Res Function(ResultRegistry) then) =
      _$ResultRegistryCopyWithImpl<$Res, ResultRegistry>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class _$ResultRegistryCopyWithImpl<$Res, $Val extends ResultRegistry>
    implements $ResultRegistryCopyWith<$Res> {
  _$ResultRegistryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultRegistry_ConfirmResultImplCopyWith<$Res>
    implements $ResultRegistryCopyWith<$Res> {
  factory _$$ResultRegistry_ConfirmResultImplCopyWith(
          _$ResultRegistry_ConfirmResultImpl value,
          $Res Function(_$ResultRegistry_ConfirmResultImpl) then) =
      __$$ResultRegistry_ConfirmResultImplCopyWithImpl<$Res>;
  @override
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
  }) {
    return confirmResult(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool status)? confirmResult,
  }) {
    return confirmResult?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool status)? confirmResult,
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
  }) {
    return confirmResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultRegistry_ConfirmResult value)? confirmResult,
  }) {
    return confirmResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultRegistry_ConfirmResult value)? confirmResult,
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

  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$ResultRegistry_ConfirmResultImplCopyWith<
          _$ResultRegistry_ConfirmResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WidgetRegistry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clickButton,
    required TResult Function(bool value) toggleButton,
    required TResult Function() confirmButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WidgetRegistry_ClickButton value) clickButton,
    required TResult Function(WidgetRegistry_ToggleButton value) toggleButton,
    required TResult Function(WidgetRegistry_ConfirmButton value) confirmButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
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
  }) {
    return clickButton();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
  }) {
    return clickButton?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
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
  }) {
    return clickButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
  }) {
    return clickButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
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
  }) {
    return toggleButton(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
  }) {
    return toggleButton?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
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
  }) {
    return toggleButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
  }) {
    return toggleButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
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
  }) {
    return confirmButton();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clickButton,
    TResult? Function(bool value)? toggleButton,
    TResult? Function()? confirmButton,
  }) {
    return confirmButton?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clickButton,
    TResult Function(bool value)? toggleButton,
    TResult Function()? confirmButton,
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
  }) {
    return confirmButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult? Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult? Function(WidgetRegistry_ConfirmButton value)? confirmButton,
  }) {
    return confirmButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WidgetRegistry_ClickButton value)? clickButton,
    TResult Function(WidgetRegistry_ToggleButton value)? toggleButton,
    TResult Function(WidgetRegistry_ConfirmButton value)? confirmButton,
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
