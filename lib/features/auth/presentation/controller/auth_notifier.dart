// lib/lib/features/auth/presentation/controller/auth_notifier.dart

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../../network/domain/models/auth_tokens.dart';
import '../../../../network/interceptors/auth_interceptor.dart';
import '../../data/datasource/auth_datasource.dart';
import '../../data/repositories/impl/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  // ➔ 1. ആപ്പ് ഓൺ ആകുമ്പോൾ സെക്യുർ സ്റ്റോറേജിൽ നിന്നും ലോഗിൻ വിവരങ്ങൾ ഉണ്ടോ എന്ന് പരിശോധിക്കുന്നു
  @override
  FutureOr<AuthTokens?> build() async {
    return await SecureStorageService.instance.readTokens();
  }

  // ➔ 2. ഈ ഫീച്ചറിന് ആവശ്യമായ Dio & Repository കോൺഫിഗർ ചെയ്യുന്നു
  AuthRepository get _repo {
    final dio = Dio();

    // ഡെവലപ്പർമാർക്ക് പരിശോധിക്കാൻ നെറ്റ്‌വർക്ക് ലോഗർ ആഡ് ചെയ്യുന്നു
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    // ➔ കൺസെപ്റ്റ്: നമ്മൾ Step 8-ൽ ഉണ്ടാക്കിയ ഇന്റർസെപ്റ്റർ ഇവിടെ ഡയോയിലേക്ക് ചേർക്കുന്നു!
    dio.interceptors.add(AuthInterceptor(dio));

    final datasource = AuthDatasource(dio);
    return AuthRepositoryImpl(datasource);
  }

  // ➔ 3. ലോഗിൻ ചെയ്യാനുള്ള പ്രവർത്തനം
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading(); // ലോഡിങ് കാണിക്കുന്നു

    final result = await _repo.login(email, password);

    result.fold(
      (apiError) =>
          state = AsyncValue.error(apiError.getFriendlyMessage(), StackTrace.current),
      (tokens) => state = AsyncValue.data(tokens), // ലോഗിൻ സക്സസ്സ്
    );
  }

  // ➔ 4. ലോഗൗട്ട് ചെയ്യാനുള്ള പ്രവർത്തനം
  Future<void> logout() async {
    state = const AsyncValue.loading();
    await SecureStorageService.instance.clearTokens();
    state = const AsyncValue.data(null); // അൺലോഗിൻഡ് സ്റ്റേറ്റ്
  }
}
