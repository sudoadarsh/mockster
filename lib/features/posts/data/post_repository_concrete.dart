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
  Future<Map<int, UserEntity>> fetchUsers() async {
    final List<UserEntity> users = await source.fetchUsers();
    final Map<int, UserEntity> hashmap = <int, UserEntity>{};
    for (final UserEntity entity in users) {
      if (entity.userId == null) continue;
      hashmap[entity.userId!] = entity;
    }
    return hashmap;
  }
}
