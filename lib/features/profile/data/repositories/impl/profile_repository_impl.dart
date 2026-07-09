// lib/features/profile/data/repositories/impl/profile_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../../../../network/domain/models/api_error.dart';
import '../../../domain/entities/user_profile_details.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../datasource/profile_datasource.dart';
import '../../models/profile_dto.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;
  ProfileRepositoryImpl(this.datasource);

  @override
  Future<Either<ApiError, UserProfileDetails>> getProfile() async {
    final env = await datasource.getProfile();

    if (!env.ok || env.data == null) {
      return left(env.error ?? const ApiError(description: 'Failed to load profile details.'));
    }

    // ➔ DTO-യിൽ നിന്നും പ്യുവർ UserProfileDetails എൻറ്റിറ്റിയിലേക്ക് മാപ്പ് ചെയ്യുന്നു
    final profileDetails = env.data!.toEntity();
    return right(profileDetails);
  }
}
