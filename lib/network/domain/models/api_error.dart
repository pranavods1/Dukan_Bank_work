// lib/network/domain/models/api_error.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    dynamic code, // ഉദാഹരണത്തിന്: '500', '404', 'ERR_CONN'
    String? description, // മെയിൻ എറർ മെസ്സേജ്
    String? mwCode, // മിഡിൽവെയർ എറർ കോഡ് (ഉണ്ടെങ്കിൽ)
    String? mwdesc, // മിഡിൽവെയർ തരുന്ന എറർ വിവരണം
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  const ApiError._();

  // സക്സസ്സ് കോഡുകൾ ആണോ എന്ന് നോക്കാൻ (പൂജ്യം ആണെങ്കിൽ സക്സസ്സ് ആണ്)
  bool get ok => code == '0000' || code == '000000' || code == '200';

  @override
  String toString() => description ?? mwdesc ?? 'എന്തോ തകരാർ സംഭവിച്ചു!';

  // ➔ കസ്റ്റമർക്ക് കാണിക്കാൻ വേണ്ടിയുള്ള ക്ലീൻ എറർ മെസ്സേജ് മാപ്പർ
  String getFriendlyMessage() {
    final intCode = int.tryParse(code.toString());

    if (intCode == null) {
      return description ??
          mwdesc ??
          'Something went wrong. Please check your network.';
    }

    switch (intCode) {
      case 400:
      case 401:
        return 'Invalid email or password. Please double check.';
      case 404:
        return 'Service is temporarily down for maintenance. Please try again later.';
      case 500:
      case 503:
        return 'Our servers are experiencing issues. Please try again shortly.';
      default:
        return description ??
            mwdesc ??
            'An unexpected error occurred. Please try again.';
    }
  }
}
