// lib/lib/network/interceptors/auth_interceptor.dart

import 'package:dio/dio.dart';
import '../../core/service/secure_storage_service.dart';
import '../domain/models/auth_tokens.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio
  dio; // ടോക്കൺ തീർന്ന റിക്വസ്റ്റുകൾ വീണ്ടും വിടാൻ ആവശ്യമായ Dio ഒബ്ജക്റ്റ്
  AuthInterceptor(this.dio);

  // ➔ 1. റിക്വസ്റ്റ് പോകുന്നതിന് മുൻപ് ടോക്കൺ വെച്ചു നൽകുന്നു
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokens = await SecureStorageService.instance.readTokens();

    // ലോഗിൻ ലിങ്കിലേക്കോ അല്ലെങ്കിൽ രജിസ്ട്രേഷൻ ലിങ്കിലേക്കോ ടോക്കൺ അയക്കേണ്ടതില്ല
    final isAuthRequest =
        options.path.contains('/auth/login') || options.path.contains('/users');

    if (tokens != null && !isAuthRequest) {
      options.headers['Authorization'] = 'Bearer ${tokens.atkn}';
    }

    super.onRequest(options, handler);
  }

  // ➔ 2. 401 എറർ ഉണ്ടാകുമ്പോൾ ടോക്കൺ പുതുക്കി വീണ്ടും റിക്വസ്റ്റ് വിടുന്നു
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // സർവർ തന്നത് 401 എറർ ആണെങ്കിൽ മാത്രം
    if (err.response?.statusCode == 401) {
      final tokens = await SecureStorageService.instance.readTokens();

      if (tokens != null) {
        try {
          // ബാക്ക്ഗ്രൗണ്ടിൽ പുതിയ ടോക്കൺ വാങ്ങാനുള്ള API വിളിക്കുന്നു
          final refreshResponse = await dio.post(
            'https://api.escuelajs.co/api/v1/auth/refresh-token',
            data: {'refreshToken': tokens.reftkn},
          );

          if (refreshResponse.statusCode == 200 ||
              refreshResponse.statusCode == 201) {
            final newAccessToken =
                refreshResponse.data['access_token'] as String;
            final newRefreshToken =
                refreshResponse.data['refresh_token'] as String;

            final newTokens = AuthTokens(
              atkn: newAccessToken,
              reftkn: newRefreshToken,
            );

            // പുതിയ ടോക്കണുകൾ സുരക്ഷിതമായി ഫോണിൽ സേവ് ചെയ്യുന്നു
            await SecureStorageService.instance.saveTokens(newTokens);

            // പരാജയപ്പെട്ട പഴയ റിക്വസ്റ്റിലേക്ക് പുതിയ ടോക്കൺ കൊടുക്കുന്നു
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newAccessToken';

            // ആ റിക്വസ്റ്റ് വീണ്ടും റൺ ചെയ്യുന്നു
            final response = await dio.fetch(options);

            // വിജയകരമായ റിസൾട്ട് റിട്ടേൺ ചെയ്യുന്നു
            return handler.resolve(response);
          }
        } catch (e) {
          // റീഫ്രഷ് ടോക്കണും തീർന്നുപോയാൽ (യൂസർ ലോഗൗട്ട് ചെയ്യേണ്ട അവസ്ഥ)
          await SecureStorageService.instance.clearTokens();
        }
      }
    }

    super.onError(err, handler);
  }
}
