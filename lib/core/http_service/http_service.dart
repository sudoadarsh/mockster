import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mockster/core/http_service/http_errors.dart';
import 'package:mockster/core/http_service/http_response_schema.dart';

import 'http_configuration.dart';

part 'http_request_params.dart';

class HttpService {
  /// Singleton pattern.
  static final HttpService _instance = HttpService._();

  factory HttpService() => _instance;

  HttpService._();

  // -------------- Class properties. --------------

  /// The configuration.
  late final HttpConfiguration configuration;

  /// The mock client. Visible only for testing.
  @visibleForTesting
  http.Client? mockClient;

  // -------------- Class methods. --------------

  /// Configure the service.
  void configure(final HttpConfiguration configuration) {
    this.configuration = configuration;
  }

  /// Create a http request.
  Future<HttpResponseSchema<T>> request<T extends Object>(
    final HttpRequestParams params, {
    final HttpResponseSchema<T>? customSchema,
  }) async {
    // The request url.
    final Uri url = _createUrl(
      params.authority,
      endpoint: params.endpoint,
      isSecured: params.isSecured ?? configuration.isSecured,
      query: params.query,
    );

    // The request headers.
    final Map<String, String> requestHeaders = _createRequestHeaders(
      params.headers,
      contentType: params.contentType,
    );

    // The request body.
    final Object? body = _createRequestBody(
      params.body,
      contentType: params.contentType,
    );

    // The request timeout duration.
    final Duration requestTimeout;
    requestTimeout = params.requestTimeout ?? configuration.requestTimeout;

    // Create the http request.
    final http.Response response;
    switch (params.method) {
      case RequestMethod.get:
        response = await http
            .get(url, headers: requestHeaders)
            .timeout(requestTimeout, onTimeout: _timeout);
      case RequestMethod.post:
        response = await http
            .post(url, headers: requestHeaders, body: body)
            .timeout(requestTimeout, onTimeout: _timeout);
      case RequestMethod.put:
        response = await http
            .put(url, headers: requestHeaders, body: body)
            .timeout(requestTimeout, onTimeout: _timeout);
      case RequestMethod.patch:
        response = await http
            .patch(url, headers: requestHeaders, body: body)
            .timeout(requestTimeout, onTimeout: _timeout);
      case RequestMethod.delete:
        response = await http
            .delete(url, headers: requestHeaders, body: body)
            .timeout(requestTimeout, onTimeout: _timeout);
    }

    // Decode the response.
    final Object? decodedResponse = jsonDecode(response.body);
    if (decodedResponse == null) throw InvalidDataError(response.body);

    // Get the response schema.
    final HttpResponseSchema<T> schema = _getSchema<T>(
      customSchema,
      decodedResponse: decodedResponse,
    );

    // Check the status code.
    if (response.statusCode ~/ 400 > 0) {
      if (response.statusCode == 408) throw RequestTimeoutError();
      throw ServerError(schema.code, schema.description);
    }

    return schema;
  }

  // -------------- Private methods. --------------

  Uri _createUrl(
    final String? authority, {
    required final String endpoint,
    final bool? isSecured,
    final Map<String, String>? query,
  }) {
    assert(authority != null || configuration.authority != null);

    if (isSecured ?? configuration.isSecured) {
      return Uri.https(authority ?? configuration.authority!, endpoint, query);
    }
    return Uri.http(authority ?? configuration.authority!, endpoint, query);
  }

  Map<String, String> _createRequestHeaders(
    final Map<String, String>? headers, {
    final Map<String, String>? extendHeaders,
    required final ContentType contentType,
  }) {
    assert(!(headers != null && extendHeaders != null));

    if (headers != null) return headers;
    final Map<String, String> value = configuration.defaultHeaders ?? {};
    value["content-type"] = contentType.value;
    if (extendHeaders != null) value.addAll(extendHeaders);
    return value;
  }

  Object? _createRequestBody(
    final Map<String, dynamic>? body, {
    required final ContentType contentType,
  }) {
    if (body == null) return null;
    switch (contentType) {
      case ContentType.json: // application/json
        return jsonEncode(body);
      case ContentType.text: // text/plain
        return body.toString();
      case ContentType.form: // application/x-www-form-urlencoded
        return body;
    }
  }

  http.Response _timeout() => http.Response("", 408);

  HttpResponseSchema<T> _getSchema<T extends Object>(
    final HttpResponseSchema<T>? schema, {
    required final Object decodedResponse,
  }) {
    if (schema != null) return schema.fromResponse<T>(decodedResponse);
    return configuration.defaultResponseSchema.fromResponse<T>(decodedResponse);
  }
}
