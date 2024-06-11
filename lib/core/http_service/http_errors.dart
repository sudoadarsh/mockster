class HttpError extends Error {}

/// Invalid response data.
class InvalidDataError extends HttpError {
  final String? response;

  InvalidDataError(this.response);
}

/// Server error.
class ServerError extends HttpError {
  final int? code;
  final String? description;

  ServerError(this.code, this.description);
}

/// Request time-out error.
class RequestTimeoutError extends HttpError {}
