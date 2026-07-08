// lib/features/users/data/models/user_detail_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_detail.dart'; // UserDetailEntity ഇമ്പോർട്ട് ചെയ്യുന്നു

part 'user_detail_dto.freezed.dart';
part 'user_detail_dto.g.dart';

@freezed
class UserDetailDto with _$UserDetailDto {
  const factory UserDetailDto({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? image,
    int? age,
    String? gender,
    String? phone,
    String? university,
  }) = _UserDetailDto;

  factory UserDetailDto.fromJson(Map<String, dynamic> json) => _$UserDetailDtoFromJson(json);
}

// DTO ➔ Entity പരിവർത്തനം (മുകളിലെ പ്യുവർ ഡാറ്റ ക്ലാസ്സിലേക്ക് മാറ്റാൻ)
extension UserDetailDtoX on UserDetailDto {
  UserDetailEntity toEntity() => UserDetailEntity(
    id: id ?? 0,
    name: '${firstName ?? ""} ${lastName ?? ""}'.trim(), // പേര് കൂട്ടിച്ചേർക്കുന്നു
    email: email ?? "",
    imageUrl: image ?? "",
    age: age ?? 0,
    gender: gender ?? "",
    phone: phone ?? "",
    university: university ?? "",
  );
}
