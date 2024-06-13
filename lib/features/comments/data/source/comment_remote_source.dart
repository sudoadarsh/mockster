import '../../../../core/http_service/http_service.dart';
import '../comment_model.dart';
import 'comment_source.dart';

class CommentRemoteSource implements CommentSource {
  @override
  Future<List<CommentModel>> fetchComments({required String postId}) async {
    final HttpRequestParams params = HttpRequestParams(
      method: RequestMethod.get,
      endpoint: "/comments",
      query: {"postId": postId},
    );
    final List response = await HttpService().request<List>(params);
    return response.map((final json) => CommentModel.fromJson(json)).toList();
  }
}
