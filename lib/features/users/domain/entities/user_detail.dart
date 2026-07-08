// lib/features/users/domain/entities/user_detail.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

@freezed
class UserDetailEntity with _$UserDetailEntity {
  const factory UserDetailEntity({
    required int id,
    required String name,
    required String email,
    required String imageUrl,
    required int age,
    required String gender,
    required String phone,
    required String university,
  }) = _UserDetailEntity;
}
