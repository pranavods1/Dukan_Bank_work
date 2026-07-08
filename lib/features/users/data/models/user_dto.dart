// lib/features/users/data/models/user_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart'; // UserEntity ഇമ്പോർട്ട് ചെയ്യുന്നു

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? image,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}

// ➔ ഇതാണ് DTO-യെ പ്യുവർ Entity ആക്കി മാറ്റുന്ന ലോജിക് (മാപ്പർ)
extension UserDtoX on UserDto {
  UserEntity toEntity() => UserEntity(
    id: id ?? 0,
    name: '${firstName ?? ""} ${lastName ?? ""}'.trim(), // ഫസ്റ്റ് നെയിമും ലാസ്റ്റ് നെയിമും കൂട്ടിച്ചേർക്കുന്നു
    email: email ?? "",
    imageUrl: image ?? "",
  );
}
