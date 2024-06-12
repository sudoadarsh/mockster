import '../domain/entities/post_entity.dart';
import '../domain/entities/user_entity.dart';
import '../domain/post_repository.dart';
import 'source/post_source.dart';

class PostRepositoryConcrete implements PostRepository {
  /// The posts source.
  final PostSource source;

  PostRepositoryConcrete({required this.source});

  @override
  Future<List<PostEntity>> fetchPosts() async => await source.fetchPosts();

  @override
  Future<List<UserEntity>> fetchUsers() async => await source.fetchUsers();
}
