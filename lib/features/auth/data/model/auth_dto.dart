// lib/lib/features/auth/data/models/auth_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../network/domain/models/auth_tokens.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

// ➔ DTO-യിൽ നിന്നും പ്യുവർ AuthTokens എൻറ്റിറ്റിയിലേക്ക് മാറ്റാനുള്ള മക്സ്റ്റൻഷൻ മാപ്പർ
extension LoginResponseDtoX on LoginResponseDto {
  AuthTokens toEntity() {
    return AuthTokens(
      atkn: accessToken,
      reftkn: refreshToken,
    );
  }
}
