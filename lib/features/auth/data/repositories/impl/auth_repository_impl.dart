// lib/lib/features/auth/data/repositories/impl/auth_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../../../../core/service/secure_storage_service.dart';
import '../../../../../network/domain/models/api_error.dart';
import '../../../../../network/domain/models/auth_tokens.dart';
import '../../../../profile/domain/entities/user_profile_details.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../datasource/auth_datasource.dart';
import '../../model/auth_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  AuthRepositoryImpl(this.datasource);

  // ➔ 1. ലോഗിൻ ചെയ്യാനുള്ള യഥാർത്ഥ ലോജിക് ഇവിടെ എഴുതുന്നു
  @override
  Future<Either<ApiError, AuthTokens>> login(
    String email,
    String password,
  ) async {
    final env = await datasource.login(email, password);

    // സർവറിൽ നിന്നും വാങ്ങിയ കവറിനുള്ളിൽ എറർ ഉണ്ടെങ്കിൽ അത് റിട്ടേൺ ചെയ്യുന്നു
    if (!env.ok || env.data == null) {
      return left(env.error ?? const ApiError(description: 'Login failed.'));
    }

    final tokens = env.data!.toEntity();

    // ➔ കൺസെപ്റ്റ്: ടോക്കണുകൾ സുരക്ഷിതമായി ഫോണിലേക്ക് സേവ് ചെയ്യുന്നു
    await SecureStorageService.instance.saveTokens(tokens);

    return right(tokens);
  }

  // ➔ 2. താഴെയുള്ളവ തൽക്കാലം കംപൈലർ എറർ ഒഴിവാക്കാൻ മാത്രം എഴുതി വെക്കുന്നു (തനിയെ പിന്നീട് ചെയ്യും)
  @override
  Future<Either<ApiError, UserProfileDetails>> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, UserProfileDetails>> getProfile() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
