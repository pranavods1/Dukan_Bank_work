// lib/lib/features/auth/data/datasource/auth_datasource.dart

import 'package:dio/dio.dart';
import '../../../../network/domain/models/api_envelope.dart';
import '../../../../network/domain/models/api_error.dart';
import '../model/auth_dto.dart';

class AuthDatasource {
  final Dio dio;
  AuthDatasource(this.dio);

  static const String _baseUrl = 'https://api.escuelajs.co/api/v1';

  // ➔ ലോഗിൻ ചെയ്യാൻ സർവറിലേക്ക് റിക്വസ്റ്റ് അയക്കുന്നു
  // lib/lib/features/auth/data/datasource/auth_datasource.dart ഫയലിൽ വരുത്തേണ്ട മാറ്റം:

  Future<ApiEnvelope<LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(
        '$_baseUrl/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dto = LoginResponseDto.fromJson(response.data);
        return ApiEnvelope.success(dto);
      } else {
        return ApiEnvelope.failure(
          ApiError(
            code: response.statusCode.toString(),
            description: 'Login failed. Please check your credentials.',
          ),
        );
      }
    } on DioException catch (e) {
      // ➔ 1. സർവർ 404, 400 പോലുള്ള എററുകൾ റിട്ടേൺ ചെയ്തിട്ടുണ്ടെങ്കിൽ അത് ഇവിടെ പിടിക്കുന്നു
      if (e.response != null) {
        // സർവർ തന്ന ആക്ച്വൽ എറർ മെസ്സേജ് എടുക്കുന്നു (ഉദാ: Cannot POST /api/v1/auth/logi)
        final serverMessage =
            e.response?.data['message']?.toString() ?? 'Server error occurred.';
        return ApiEnvelope.failure(
          ApiError(
            code: e.response?.statusCode.toString(),
            description: serverMessage,
          ),
        );
      }

      // ➔ 2. ഇന്റർനെറ്റ് ഒട്ടും ഇല്ലാത്ത അവസ്ഥയിലുള്ള എറർ
      return ApiEnvelope.failure(
        ApiError(
          code: 'NETWORK_ERROR',
          description:
              'Failed to connect to the server. Please check your internet.',
        ),
      );
    } catch (e) {
      // മറ്റ് അൺനോൺ എററുകൾക്ക്
      return ApiEnvelope.failure(
        ApiError(code: 'UNKNOWN_ERROR', description: e.toString()),
      );
    }
  }
}
