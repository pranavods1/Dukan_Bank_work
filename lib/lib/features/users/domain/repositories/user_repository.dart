// lib/features/users/domain/repositories/user_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../network/domain/models/api_error.dart';
import '../entities/user.dart';

abstract class UserRepository {
  // ഈ ഫംഗ്ഷൻ വിളിച്ചാൽ ഒന്നുകിൽ എറർ (String) അല്ലെങ്കിൽ യൂസർ ലിസ്റ്റ് (List<UserEntity>) കിട്ടും
  Future<Either<ApiError, List<UserEntity>>> fetchUsers();
}
