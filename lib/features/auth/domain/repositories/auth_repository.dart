// lib/lib/features/auth/domain/repositories/auth_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../network/domain/models/api_error.dart';
import '../../../../network/domain/models/auth_tokens.dart';
import '../../../profile/domain/entities/user_profile_details.dart';

abstract class AuthRepository {
  // ➔ 1. ലോഗിൻ ചെയ്യാനുള്ള ഫംഗ്ഷൻ (വിജയകരമായാൽ AuthTokens തരും)
  Future<Either<ApiError, AuthTokens>> login(String email, String password);

  // ➔ 2. പുതിയ അക്കൗണ്ട് രജിസ്റ്റർ ചെയ്യാനുള്ള ഫംഗ്ഷൻ (വിജയകരമായാൽ UserProfileDetails തരും)
  Future<Either<ApiError, UserProfileDetails>> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  });

  // ➔ 3. ലോഗിൻ ചെയ്ത യൂസറുടെ പ്രൊഫൈൽ വിവരങ്ങൾ ഫെച്ച് ചെയ്യാൻ
  Future<Either<ApiError, UserProfileDetails>> getProfile();

  // ➔ 4. ആപ്പിൽ നിന്നും ലോഗൗട്ട് ചെയ്യാൻ
  Future<void> logout();
}
