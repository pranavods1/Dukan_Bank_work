// lib/features/users/data/repositories/impl/user_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../../../../network/domain/models/api_error.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../datasource/user_datasource.dart';
import '../../models/user_dto.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;
  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<ApiError, List<UserEntity>>> fetchUsers() async {
    // 1. ഡാറ്റാസോഴ്സിൽ നിന്നും കവർ (ApiEnvelope) വാങ്ങുന്നു
    final env = await datasource.getUsers();

    // 2. കവറിനുള്ളിൽ എറർ ഉണ്ടെങ്കിൽ അത് Left വഴി Notifier-ലേക്ക് അയക്കുന്നു
    if (!env.ok || env.data == null) {
      // ഡാറ്റാസോഴ്സിൽ എറർ ഉണ്ടെങ്കിൽ അത് കൊടുക്കുന്നു, അല്ലെങ്കിൽ ഒരു ഡിഫോൾട്ട് എറർ
      return left(env.error ?? const ApiError(description: 'ഡാറ്റ ലഭിച്ചില്ല!'));
    }

    // 3. കവറിനുള്ളിൽ ഡാറ്റ ഉണ്ടെങ്കിൽ അതിലെ ഓരോ UserDto-യെയും UserEntity ആക്കി മാറ്റുന്നു
    final userDtos = env.data!.users ?? [];
    final userEntities = userDtos.map((dto) => dto.toEntity()).toList();

    // 4. വിജയകരമായി ബിരിയാണി പ്ലേറ്റ് (Entity List) Right വഴി Notifier-ലേക്ക് അയക്കുന്നു
    return right(userEntities);
  }
}
