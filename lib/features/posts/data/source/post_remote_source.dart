import '../../../../core/http_service/http_service.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';
import 'post_source.dart';

class PostRemoteSource implements PostSource {
  @override
  Future<List<PostModel>> fetchPosts() async {
    final HttpRequestParams params = HttpRequestParams(
      method: RequestMethod.get,
      endpoint: "/posts",
    );
    final List response = await HttpService().request<List>(params);
    return response.map((final json) => PostModel.fromJson(json)).toList();
  }

  @override
  Future<List<UserModel>> fetchUsers() async {
    final HttpRequestParams params = HttpRequestParams(
      method: RequestMethod.get,
      endpoint: "/users",
    );
    final List response = await HttpService().request<List>(params);
    return response.map((final json) => UserModel.fromJson(json)).toList();
  }
}
