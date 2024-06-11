class HttpResponseSchema<T extends Object> {
  final int? code;
  final T? data;
  final String? description;

  const HttpResponseSchema({this.code, this.data, this.description});

  HttpResponseSchema<E> fromResponse<E extends Object>(final response) {
    return HttpResponseSchema<E>(
      code: response["code"],
      data: response["data"],
      description: response["description"]
    );
  }
}
