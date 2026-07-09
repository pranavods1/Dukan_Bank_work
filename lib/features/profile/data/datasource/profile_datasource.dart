// lib/features/profile/data/datasource/profile_datasource.dart

import 'package:dio/dio.dart';
import '../../../../network/domain/models/api_envelope.dart';
import '../../../../network/domain/models/api_error.dart';
import '../models/profile_dto.dart';

class ProfileDatasource {
  final Dio dio;
  ProfileDatasource(this.dio);

  static const String _baseUrl = 'https://api.escuelajs.co/api/v1';

  // ➔ യൂസറുടെ പ്രൊഫൈൽ എപിഐ വിളിച്ച് വിവരങ്ങൾ വാങ്ങുന്നു
  Future<ApiEnvelope<UserProfileDto>> getProfile() async {
    try {
      final response = await dio.get('$_baseUrl/auth/profile');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final dto = UserProfileDto.fromJson(response.data);
        return ApiEnvelope.success(dto);
      } else {
        return ApiEnvelope.failure(
          ApiError(
            code: response.statusCode.toString(),
            description: 'Failed to load user profile.',
          ),
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final serverMessage =
            e.response?.data['message']?.toString() ?? 'Server error occurred.';
        return ApiEnvelope.failure(
          ApiError(
            code: e.response?.statusCode.toString(),
            description: serverMessage,
          ),
        );
      }
      return ApiEnvelope.failure(
        const ApiError(
          code: 'NETWORK_ERROR',
          description:
              'Failed to connect to the server. Please check your internet.',
        ),
      );
    } catch (e) {
      return ApiEnvelope.failure(
        ApiError(code: 'UNKNOWN_ERROR', description: e.toString()),
      );
    }
  }
}
