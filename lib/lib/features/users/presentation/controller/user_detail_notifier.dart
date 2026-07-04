// lib/features/users/presentation/controller/user_detail_notifier.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../../../network/domain/models/api_error.dart';
import '../../data/datasource/user_datasource.dart';
import '../../data/repositories/impl/user_repository_impl.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/repositories/user_repository.dart';


part 'user_detail_notifier.g.dart'; // റിവർപോഡ് ജനറേറ്റ് ചെയ്യുന്ന ഫയൽ

@riverpod
class UserDetailNotifier extends _$UserDetailNotifier {
  // 1. റിവർപോഡിന്റെ build() ഫംഗ്ഷനിലേക്ക് userId പാസ്സ് ചെയ്യുന്നു (Family Provider)
  @override
  AsyncValue<UserDetailEntity> build(int userId) {
    // ഈ പ്രൊവൈഡർ ലിങ്ക് ചെയ്യുമ്പോൾ തന്നെ തനിയെ ആ യൂസറുടെ API വിളിക്കുന്നു
    getUserDetails(userId);
    return const AsyncValue.loading();
  }

  UserRepository get _repo {
    final dio = Dio();
    // നമ്മൾ മുൻപ് ചെയ്തതുപോലെ നെറ്റ്‌വർക്ക് ലോഗർ ചേർക്കാം (ഓപ്ഷണൽ)
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    final datasource = UserDatasource(dio);
    return UserRepositoryImpl(datasource);
  }

  Future<void> getUserDetails(int userId) async {
    state = const AsyncValue.loading();

    final result = await _repo.fetchUserDetails(userId);

    result.fold(
      (apiError) =>
          state = AsyncValue.error(apiError.toString(), StackTrace.current),
      (userDetail) => state = AsyncValue.data(userDetail),
    );
  }
}
