part of "http_service.dart";

enum RequestMethod { get, post, put, patch, delete }

enum ContentType {
  json("application/json"),
  text("text/plain"),
  form("application/x-www-form-urlencoded");

  final String value;

  const ContentType(this.value);
}

class HttpRequestParams {
  /// Whether the authority is secured or not.
  final bool? isSecured;

  /// The authority.
  final String? authority;

  /// The request method.
  final RequestMethod method;

  /// The path/ endpoint.
  final String endpoint;

  /// The request headers.
  final Map<String, String>? headers;

  /// The request body.
  final Map<String, dynamic>? body;

  /// The content type.
  final ContentType contentType;

  /// The query parameters.
  final Map<String, String>? query;

  /// The request time-out duration.
  final Duration? requestTimeout;

  HttpRequestParams({
    this.isSecured,
    this.authority,
    required this.method,
    required this.endpoint,
    this.headers,
    this.body,
    this.contentType = ContentType.json,
    this.query,
    this.requestTimeout,
  });
}
