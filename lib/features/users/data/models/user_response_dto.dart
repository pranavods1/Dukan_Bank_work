// lib/features/users/data/models/user_response_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart'; // UserDto ഇമ്പോർട്ട് ചെയ്യുന്നു

part 'user_response_dto.freezed.dart';
part 'user_response_dto.g.dart';

@freezed
class UserResponseDto with _$UserResponseDto {
  const factory UserResponseDto({
    List<UserDto>? users, // സർവറിലെ "users" എന്ന ലിസ്റ്റിനെ ഇവിടെ മാപ്പ് ചെയ്യുന്നു
  }) = _UserResponseDto;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) => _$UserResponseDtoFromJson(json);
}
