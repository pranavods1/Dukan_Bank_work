// lib/network/domain/models/api_envelope.dart

import './api_error.dart'; // നമ്മൾ നിർമ്മിച്ച ApiError

class ApiEnvelope<T> {
  final bool ok;          // റിക്വസ്റ്റ് വിജയകരമാണോ?
  final T? data;          // വിജയിച്ചാൽ ഉള്ള ഡാറ്റ
  final ApiError? error;  // പരാജയപ്പെട്ടാൽ ഉള്ള എറർ

  ApiEnvelope({required this.ok, this.data, this.error});

  // വിജയിക്കുമ്പോൾ വിളിക്കാൻ:
  factory ApiEnvelope.success(T data) => ApiEnvelope(ok: true, data: data);

  // പരാജയപ്പെടുമ്പോൾ വിളിക്കാൻ:
  factory ApiEnvelope.failure(ApiError error) => ApiEnvelope(ok: false, error: error);
}
