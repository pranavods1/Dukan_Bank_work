// lib/features/profile/data/models/profile_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile_details.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    required int id,
    required String name,
    required String email,
    required String avatar,
    required String role,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
}

extension UserProfileDtoX on UserProfileDto {
  UserProfileDetails toEntity() {
    return UserProfileDetails(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      role: role,
    );
  }
}
