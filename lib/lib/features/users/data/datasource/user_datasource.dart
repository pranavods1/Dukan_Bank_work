// lib/features/users/data/datasource/user_datasource.dart

import 'package:dio/dio.dart';
import '../../../../network/data/urls/user_urls.dart';
import '../../../../network/domain/models/api_envelope.dart'; // പുതിയ ഇമ്പോർട്ട്
import '../../../../network/domain/models/api_error.dart';    // പുതിയ ഇമ്പോർട്ട്
import '../models/user_response_dto.dart';

class UserDatasource {
  final Dio dio;
  UserDatasource(this.dio);

  // റിട്ടേൺ ടൈപ്പ് ApiEnvelope ആക്കി മാറ്റുന്നു!
  Future<ApiEnvelope<UserResponseDto>> getUsers() async {
    try {
      final response = await dio.get('${UserUrls.baseUrl}${UserUrls.fetchUsers}');

      if (response.statusCode == 200) {
        final dtoList = UserResponseDto.fromJson(response.data);
        return ApiEnvelope.success(dtoList); // send success envelope
      } else {
        return ApiEnvelope.failure(ApiError(
          code: response.statusCode.toString(),
          description: 'Server error occurred. Please try again later.',
        )); // server error envelope
      }
    } catch (e) {
      return ApiEnvelope.failure(ApiError(
        code: 'NETWORK_ERROR',
        description: 'Failed to connect to the internet. Please check your network.',
      )); // network error envelope
    }
  }
}
