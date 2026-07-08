// lib/features/users/presentation/state/user_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';


part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(List<UserEntity> users) = _Success;
  const factory UserState.failure(String errorMessage) = _Failure;
}
