// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserDetailEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get university => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailEntityCopyWith<UserDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailEntityCopyWith<$Res> {
  factory $UserDetailEntityCopyWith(
    UserDetailEntity value,
    $Res Function(UserDetailEntity) then,
  ) = _$UserDetailEntityCopyWithImpl<$Res, UserDetailEntity>;
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    String imageUrl,
    int age,
    String gender,
    String phone,
    String university,
  });
}

/// @nodoc
class _$UserDetailEntityCopyWithImpl<$Res, $Val extends UserDetailEntity>
    implements $UserDetailEntityCopyWith<$Res> {
  _$UserDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? imageUrl = null,
    Object? age = null,
    Object? gender = null,
    Object? phone = null,
    Object? university = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            university: null == university
                ? _value.university
                : university // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDetailEntityImplCopyWith<$Res>
    implements $UserDetailEntityCopyWith<$Res> {
  factory _$$UserDetailEntityImplCopyWith(
    _$UserDetailEntityImpl value,
    $Res Function(_$UserDetailEntityImpl) then,
  ) = __$$UserDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    String imageUrl,
    int age,
    String gender,
    String phone,
    String university,
  });
}

/// @nodoc
class __$$UserDetailEntityImplCopyWithImpl<$Res>
    extends _$UserDetailEntityCopyWithImpl<$Res, _$UserDetailEntityImpl>
    implements _$$UserDetailEntityImplCopyWith<$Res> {
  __$$UserDetailEntityImplCopyWithImpl(
    _$UserDetailEntityImpl _value,
    $Res Function(_$UserDetailEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? imageUrl = null,
    Object? age = null,
    Object? gender = null,
    Object? phone = null,
    Object? university = null,
  }) {
    return _then(
      _$UserDetailEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        university: null == university
            ? _value.university
            : university // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UserDetailEntityImpl implements _UserDetailEntity {
  const _$UserDetailEntityImpl({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.age,
    required this.gender,
    required this.phone,
    required this.university,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String imageUrl;
  @override
  final int age;
  @override
  final String gender;
  @override
  final String phone;
  @override
  final String university;

  @override
  String toString() {
    return 'UserDetailEntity(id: $id, name: $name, email: $email, imageUrl: $imageUrl, age: $age, gender: $gender, phone: $phone, university: $university)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.university, university) ||
                other.university == university));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    imageUrl,
    age,
    gender,
    phone,
    university,
  );

  /// Create a copy of UserDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailEntityImplCopyWith<_$UserDetailEntityImpl> get copyWith =>
      __$$UserDetailEntityImplCopyWithImpl<_$UserDetailEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _UserDetailEntity implements UserDetailEntity {
  const factory _UserDetailEntity({
    required final int id,
    required final String name,
    required final String email,
    required final String imageUrl,
    required final int age,
    required final String gender,
    required final String phone,
    required final String university,
  }) = _$UserDetailEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get imageUrl;
  @override
  int get age;
  @override
  String get gender;
  @override
  String get phone;
  @override
  String get university;

  /// Create a copy of UserDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailEntityImplCopyWith<_$UserDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
