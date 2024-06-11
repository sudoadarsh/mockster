import 'package:mockster/core/http_service/http_response_schema.dart';

class HttpConfiguration {
  /// Whether the authority is secured or not.
  bool isSecured = true;

  /// The default authority.
  String? authority;

  /// The default headers.
  Map<String, String>? defaultHeaders;

  /// The default request timeout duration.
  Duration requestTimeout = const Duration(seconds: 10);

  /// The default response schema.
  HttpResponseSchema defaultResponseSchema = const HttpResponseSchema();
}
