// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) {
  return _UserResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UserResponseDto {
  List<UserDto>? get users => throw _privateConstructorUsedError;

  /// Serializes this UserResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseDtoCopyWith<UserResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDtoCopyWith<$Res> {
  factory $UserResponseDtoCopyWith(
    UserResponseDto value,
    $Res Function(UserResponseDto) then,
  ) = _$UserResponseDtoCopyWithImpl<$Res, UserResponseDto>;
  @useResult
  $Res call({List<UserDto>? users});
}

/// @nodoc
class _$UserResponseDtoCopyWithImpl<$Res, $Val extends UserResponseDto>
    implements $UserResponseDtoCopyWith<$Res> {
  _$UserResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = freezed}) {
    return _then(
      _value.copyWith(
            users: freezed == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as List<UserDto>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserResponseDtoImplCopyWith<$Res>
    implements $UserResponseDtoCopyWith<$Res> {
  factory _$$UserResponseDtoImplCopyWith(
    _$UserResponseDtoImpl value,
    $Res Function(_$UserResponseDtoImpl) then,
  ) = __$$UserResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDto>? users});
}

/// @nodoc
class __$$UserResponseDtoImplCopyWithImpl<$Res>
    extends _$UserResponseDtoCopyWithImpl<$Res, _$UserResponseDtoImpl>
    implements _$$UserResponseDtoImplCopyWith<$Res> {
  __$$UserResponseDtoImplCopyWithImpl(
    _$UserResponseDtoImpl _value,
    $Res Function(_$UserResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = freezed}) {
    return _then(
      _$UserResponseDtoImpl(
        users: freezed == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<UserDto>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDtoImpl implements _UserResponseDto {
  const _$UserResponseDtoImpl({final List<UserDto>? users}) : _users = users;

  factory _$UserResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDtoImplFromJson(json);

  final List<UserDto>? _users;
  @override
  List<UserDto>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserResponseDto(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  /// Create a copy of UserResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDtoImplCopyWith<_$UserResponseDtoImpl> get copyWith =>
      __$$UserResponseDtoImplCopyWithImpl<_$UserResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDtoImplToJson(this);
  }
}

abstract class _UserResponseDto implements UserResponseDto {
  const factory _UserResponseDto({final List<UserDto>? users}) =
      _$UserResponseDtoImpl;

  factory _UserResponseDto.fromJson(Map<String, dynamic> json) =
      _$UserResponseDtoImpl.fromJson;

  @override
  List<UserDto>? get users;

  /// Create a copy of UserResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponseDtoImplCopyWith<_$UserResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
