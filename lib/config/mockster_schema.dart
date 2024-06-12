import '../core/http_service/http_response_schema.dart';

class MocksterSchema extends HttpResponseSchema {
  @override
  HttpResponseSchema<E> fromResponse<E extends Object>(response) {
    return HttpResponseSchema(data: response);
  }
}
