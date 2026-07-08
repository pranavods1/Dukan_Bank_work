// lib/lib/core/services/secure_storage_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../network/domain/models/auth_tokens.dart';

class SecureStorageService {
  SecureStorageService._();
  static final instance = SecureStorageService._();

  final _storage = const FlutterSecureStorage();

  static const _kAccessTokenKey = 'access_token_key';
  static const _kRefreshTokenKey = 'refresh_token_key';

  // ➔ 1. ടോക്കണുകൾ സുരക്ഷിതമായി സേവ് ചെയ്യാൻ
  Future<void> saveTokens(AuthTokens tokens) async {
    await _storage.write(key: _kAccessTokenKey, value: tokens.atkn);
    await _storage.write(key: _kRefreshTokenKey, value: tokens.reftkn);
  }

  // ➔ 2. ടോക്കണുകൾ വായിച്ചെടുക്കാൻ
  Future<AuthTokens?> readTokens() async {
    final atkn = await _storage.read(key: _kAccessTokenKey);
    final reftkn = await _storage.read(key: _kRefreshTokenKey);

    if (atkn != null && reftkn != null) {
      return AuthTokens(atkn: atkn, reftkn: reftkn);
    }
    return null;
  }

  // ➔ 3. ലോഗൗട്ട് ചെയ്യുമ്പോൾ ടോക്കണുകൾ ഡിലീറ്റ് ചെയ്യാൻ
  Future<void> clearTokens() async {
    await _storage.delete(key: _kAccessTokenKey);
    await _storage.delete(key: _kRefreshTokenKey);
  }
}
