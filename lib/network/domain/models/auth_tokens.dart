// lib/lib/network/domain/models/auth_tokens.dart

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String atkn,    // Access Token
    required String reftkn,  // Refresh Token
  }) = _AuthTokens;

  const AuthTokens._();

  bool get isAccessTokenExpired => isExpiredToken(atkn);
  bool get isRefreshTokenExpired => isExpiredToken(reftkn);

  bool isExpiredToken(String? token) {
    if (token == null) {
      debugPrint('Token is null');
      return true;
    }

    // ഭാവിയിൽ JWT ടോക്കൺ വാലിഡേഷൻ ലോജിക് വേണമെങ്കിൽ ഇവിടെ എഴുതാം:
    // try {
    //   final expTime = JWT.decode(token).payload["exp"] as int;
    //   final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    //   return expTime < now;
    // } catch (e) {
    //   return true;
    // }
    return false; // തൽക്കാലം എക്സ്പയർ അല്ല എന്ന് റിട്ടേൺ ചെയ്യുന്നു
  }
}
