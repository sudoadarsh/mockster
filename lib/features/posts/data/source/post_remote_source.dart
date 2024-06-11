import 'package:mockster/core/http_service/http_response_schema.dart';
import 'package:mockster/core/http_service/http_service.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';
import 'post_source.dart';

class PostRemoteSource implements PostSource {
  @override
  Future<List<PostModel>?> fetchPosts() async {
    final HttpRequestParams params = HttpRequestParams(
      method: RequestMethod.get,
      endpoint: "/posts",
    );
    final HttpResponseSchema<List> responseSchema;
    responseSchema = await HttpService().request<List>(params);
    return responseSchema.data
        ?.map((final json) => PostModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<UserModel>?> fetchUsers() async {
    final HttpRequestParams params = HttpRequestParams(
      method: RequestMethod.get,
      endpoint: "/users",
    );
    final HttpResponseSchema<List> responseSchema;
    responseSchema = await HttpService().request<List>(params);
    return responseSchema.data
        ?.map((final json) => UserModel.fromJson(json))
        .toList();
  }
}
