// lib/features/profile/domain/repositories/profile_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../network/domain/models/api_error.dart';
import '../entities/user_profile_details.dart';

abstract class ProfileRepository {
  // ➔ പ്രൊഫൈൽ ലോഡ് ചെയ്യാനുള്ള കരാർ ഫംഗ്ഷൻ
  Future<Either<ApiError, UserProfileDetails>> getProfile();
}
