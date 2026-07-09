// lib/features/profile/presentation/controller/profile_notifier.dart

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../features/auth/presentation/controller/auth_notifier.dart';
import '../../../../network/interceptors/auth_interceptor.dart';
import '../../data/datasource/profile_datasource.dart';
import '../../data/repositories/impl/profile_repository_impl.dart';
import '../../domain/entities/user_profile_details.dart';

part 'profile_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  
  // ➔ 1. ലോഗിൻ സ്റ്റേറ്റ് വാച്ച് ചെയ്യുന്നു
  @override
  FutureOr<UserProfileDetails?> build() async {
    final authState = ref.watch(authNotifierProvider);

    // ലോഗിൻ വിവരങ്ങൾ ഇല്ലെങ്കിൽ പ്രൊഫൈൽ ഫെച്ച് ചെയ്യേണ്ടതില്ല (null റിട്ടേൺ ചെയ്യും)
    final tokens = authState.valueOrNull;
    if (tokens == null) {
      return null;
    }

    // ➔ 2. ലോഗിൻ വിവരങ്ങൾ ഉണ്ടെങ്കിൽ പ്രൊഫൈൽ എപിഐ വിളിക്കുന്നു
    return await _fetchProfile();
  }

  // ➔ 3. പ്രൊഫൈൽ എപിഐ വിളിക്കാനുള്ള ഹെൽപ്പർ ഫംഗ്ഷൻ
  Future<UserProfileDetails?> _fetchProfile() async {
    final dio = Dio();
    
    // ഡെവലപ്പർ ലോഗുകൾക്കായി
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    
    // ➔ കൺസെപ്റ്റ്: ടോക്കൺ ഓട്ടോമാറ്റിക് ആയി വെക്കാൻ ഇന്റർസെപ്റ്റർ ഇവിടെ ഡയോയിലേക്ക് ചേർക്കുന്നു!
    dio.interceptors.add(AuthInterceptor(dio));

    final datasource = ProfileDatasource(dio);
    final repo = ProfileRepositoryImpl(datasource);

    final result = await repo.getProfile();
    
    return result.fold(
      (apiError) => throw apiError.getFriendlyMessage(),
      (profile) => profile,
    );
  }
}
