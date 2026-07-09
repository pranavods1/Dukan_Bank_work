import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_details.freezed.dart';

@freezed
class UserProfileDetails with _$UserProfileDetails {
  const factory UserProfileDetails({
    required int id,
    required String name,
    required String email,
    required String avatar,
    required String role,
  }) = _UserProfileDetails;
}
