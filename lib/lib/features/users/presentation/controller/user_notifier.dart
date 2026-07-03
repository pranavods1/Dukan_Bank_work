// lib/features/users/presentation/controller/user_notifier.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../data/datasource/user_datasource.dart';
import '../../data/repositories/impl/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../state/user_state.dart';

part 'user_notifier.g.dart'; // റിവർപോഡ് ജനറേറ്റ് ചെയ്യുന്ന ഫയൽ

@riverpod
class UserNotifier extends _$UserNotifier {

  @override
  UserState build() => const UserState.initial(); // ആപ്പ് തുടങ്ങുമ്പോൾ Initial സ്റ്റേറ്റ്

  // ➔ ഹെഡ് ഷെഫിനെ (Repository) ബന്ധിപ്പിക്കുന്ന ലോജിക്
  UserRepository get _repo {
    final dio = Dio();
    final datasource = UserDatasource(dio);
    return UserRepositoryImpl(datasource);
  }

  // ➔ സ്ക്രീനിൽ നിന്ന് ഓർഡർ സ്വീകരിക്കുന്ന ഫംഗ്ഷൻ
  Future<void> getUsers() async {
    state = const UserState.loading(); // 1. വെയ്റ്റർ പ്ലേറ്റ് ലോഡിങ് ആക്കുന്നു

    final result = await _repo.fetchUsers(); // 2. ഷെഫിനോട് ഓർഡർ ചോദിക്കുന്നു

    // 3. ഫലം വെയ്റ്റർ വിലയിരുത്തുന്നു (Either.fold)
    result.fold(
          (apiError) {
        // പരാജയപ്പെട്ടാൽ പ്ലേറ്റിൽ എറർ മെസ്സേജ് കാണിക്കുന്നു
        state = UserState.failure(apiError.toString());
      },
          (userList) {
        // വിജയിച്ചാൽ പ്ലേറ്റിൽ റെഡിയായ യൂസർ ലിസ്റ്റ് കൊടുക്കുന്നു
        state = UserState.success(userList);
      },
    );
  }
}
