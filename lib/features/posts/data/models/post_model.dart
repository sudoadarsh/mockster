import 'package:flutter/foundation.dart';

import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  int? userId_;
  int? id;
  String? title_;
  String? body_;

  PostModel({this.userId_, this.id, this.title_, this.body_});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId_ = userId =  json['userId'];
    id = postId = json['id'];
    title_ = title = json['title'];
    body_ = body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId_;
    data['id'] = id;
    data['title'] = title_;
    data['body'] = body_;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is PostModel) return mapEquals(toJson(), other.toJson());
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
