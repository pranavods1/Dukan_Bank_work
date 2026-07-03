// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return _ApiError.fromJson(json);
}

/// @nodoc
mixin _$ApiError {
  dynamic get code =>
      throw _privateConstructorUsedError; // ഉദാഹരണത്തിന്: '500', '404', 'ERR_CONN'
  String? get description =>
      throw _privateConstructorUsedError; // മെയിൻ എറർ മെസ്സേജ്
  String? get mwCode =>
      throw _privateConstructorUsedError; // മിഡിൽവെയർ എറർ കോഡ് (ഉണ്ടെങ്കിൽ)
  String? get mwdesc => throw _privateConstructorUsedError;

  /// Serializes this ApiError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
  @useResult
  $Res call({
    dynamic code,
    String? description,
    String? mwCode,
    String? mwdesc,
  });
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? mwCode = freezed,
    Object? mwdesc = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            mwCode: freezed == mwCode
                ? _value.mwCode
                : mwCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            mwdesc: freezed == mwdesc
                ? _value.mwdesc
                : mwdesc // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
    _$ApiErrorImpl value,
    $Res Function(_$ApiErrorImpl) then,
  ) = __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    dynamic code,
    String? description,
    String? mwCode,
    String? mwdesc,
  });
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
    _$ApiErrorImpl _value,
    $Res Function(_$ApiErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? mwCode = freezed,
    Object? mwdesc = freezed,
  }) {
    return _then(
      _$ApiErrorImpl(
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        mwCode: freezed == mwCode
            ? _value.mwCode
            : mwCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        mwdesc: freezed == mwdesc
            ? _value.mwdesc
            : mwdesc // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorImpl extends _ApiError {
  const _$ApiErrorImpl({this.code, this.description, this.mwCode, this.mwdesc})
    : super._();

  factory _$ApiErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorImplFromJson(json);

  @override
  final dynamic code;
  // ഉദാഹരണത്തിന്: '500', '404', 'ERR_CONN'
  @override
  final String? description;
  // മെയിൻ എറർ മെസ്സേജ്
  @override
  final String? mwCode;
  // മിഡിൽവെയർ എറർ കോഡ് (ഉണ്ടെങ്കിൽ)
  @override
  final String? mwdesc;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            const DeepCollectionEquality().equals(other.code, code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mwCode, mwCode) || other.mwCode == mwCode) &&
            (identical(other.mwdesc, mwdesc) || other.mwdesc == mwdesc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(code),
    description,
    mwCode,
    mwdesc,
  );

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorImplToJson(this);
  }
}

abstract class _ApiError extends ApiError {
  const factory _ApiError({
    final dynamic code,
    final String? description,
    final String? mwCode,
    final String? mwdesc,
  }) = _$ApiErrorImpl;
  const _ApiError._() : super._();

  factory _ApiError.fromJson(Map<String, dynamic> json) =
      _$ApiErrorImpl.fromJson;

  @override
  dynamic get code; // ഉദാഹരണത്തിന്: '500', '404', 'ERR_CONN'
  @override
  String? get description; // മെയിൻ എറർ മെസ്സേജ്
  @override
  String? get mwCode; // മിഡിൽവെയർ എറർ കോഡ് (ഉണ്ടെങ്കിൽ)
  @override
  String? get mwdesc;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
