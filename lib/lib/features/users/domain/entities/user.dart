// lib/features/users/domain/entities/user.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart'; // കോഡ് ജനറേറ്റ് ചെയ്യാൻ ഇത് ആവശ്യമാണ്

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String name,
    required String email,
    required String imageUrl,
  }) = _UserEntity;
}
