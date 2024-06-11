import 'user_entity.dart';

class PostEntity {
  final int? postId;
  final int? userId;
  final String? title;
  final String? body;

  /// The detail of the user.
  final UserEntity? user;

  PostEntity({this.postId, this.userId, this.title, this.body, this.user});
}
