import '../domain/entities/post_entity.dart';
import '../domain/entities/user_entity.dart';
import '../domain/post_repository.dart';
import 'source/post_source.dart';

class PostRepositoryConcrete implements PostRepository {
  /// The posts source.
  final PostSource source;

  PostRepositoryConcrete({required this.source});

  @override
  Future<List<PostEntity>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> fetchUsers() {
    // TODO: implement fetchUsers
    throw UnimplementedError();
  }
}