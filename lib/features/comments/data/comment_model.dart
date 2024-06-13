import '../domain/comment_entity.dart';

class CommentModel extends CommentEntity {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body});

  CommentModel.fromJson(Map<String, dynamic> json) {
    postId = post = json['postId'];
    id = commentId = json['id'];
    name = json['name'];
    email = commentator = json['email'];
    body = comment = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
