// lib/features/users/presentation/controller/user_notifier.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../../../network/domain/models/api_error.dart';
import '../../data/datasource/user_datasource.dart';
import '../../data/repositories/impl/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart'; // UserEntity ഇമ്പോർട്ട് ചെയ്യുന്നു

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {

  // 1. റിവർപോഡിന്റെ ഡിഫോൾട്ട് AsyncValue ആണ് സ്റ്റേറ്റ് ടൈപ്പ്
  @override
  AsyncValue<List<UserEntity>> build() => const AsyncValue.loading();

  UserRepository get _repo {
    final dio = Dio();
    // ➔ ഇന്റർനെറ്റ് റിക്വസ്റ്റ് ലോഗ് ചെയ്യാൻ ഇത് ആഡ് ചെയ്യുക:
    dio.interceptors.add(
      LogInterceptor(
        request: true,        // യുആർഎൽ പ്രിന്റ് ചെയ്യാൻ
        requestHeader: false, // ഹെഡറുകൾ തൽക്കാലം കാണിക്കേണ്ടതില്ല
        requestBody: true,    // സർവറിലേക്ക് അയക്കുന്ന ഡാറ്റ കാണിക്കാൻ
        responseBody: true,   // സർവറിൽ നിന്ന് തിരികെ തരുന്ന JSON കാണിക്കാൻ
        error: true,          // എറർ ഉണ്ടായാൽ അത് കാണിക്കാൻ
      ),
    );

    final datasource = UserDatasource(dio);
    return UserRepositoryImpl(datasource);
  }

  Future<void> getUsers() async {
    state = const AsyncValue.loading(); // 2. ലോഡിങ് ആക്കുന്നു

    final result = await _repo.fetchUsers();

    result.fold(
      // 3. പരാജയപ്പെട്ടാൽ റിവർപോഡ് ഡിഫോൾട്ട് എറർ സ്റ്റേറ്റ്
          (apiError) => state = AsyncValue.error(apiError.toString(), StackTrace.current),
      // 4. വിജയിച്ചാൽ റിവർപോഡ് ഡിഫോൾട്ട് സക്സസ്സ് സ്റ്റേറ്റ്
          (userList) => state = AsyncValue.data(userList),
    );
  }
}
