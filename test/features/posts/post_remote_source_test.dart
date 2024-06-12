import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import "package:http/testing.dart";
import 'package:mockster/config/mockster_schema.dart';
import 'package:mockster/core/http_service/http_configuration.dart';
import 'package:mockster/core/http_service/http_service.dart';
import 'package:mockster/features/posts/data/models/post_model.dart';
import 'package:mockster/features/posts/data/models/user_model.dart';
import 'package:mockster/features/posts/data/source/post_remote_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List postJson =
      jsonDecode(await rootBundle.loadString("mock/mock_post.json"));
  final List userJson =
      jsonDecode(await rootBundle.loadString("mock/mock_user.json"));

  final List<PostModel> mockPosts = [PostModel.fromJson(postJson[0])];
  final List<UserModel> mockUsers = [UserModel.fromJson(userJson[0])];

  // Code to run before starting tests.
  setUpAll(() {
    // The network configuration.
    final HttpConfiguration configuration = HttpConfiguration();
    configuration.authority = "jsonplaceholder.typicode.com";
    configuration.defaultResponseSchema = MocksterSchema();
    HttpService().configure(configuration);
  });

  test("should return array of posts", () async {
    // Arrange.
    HttpService().mockClient = MockClient((_) async {
      return Response(jsonEncode(postJson), 200);
    });
    // Act.
    final List<PostModel> posts = await PostRemoteSource().fetchPosts();
    // Assert.
    expect(posts, mockPosts);
  });

  test("should return array of users", () async {
    // Arrange.
    HttpService().mockClient = MockClient((_) async {
      return Response(jsonEncode(mockUsers), 200);
    });
    // Act.
    final List<UserModel> posts = await PostRemoteSource().fetchUsers();
    // Assert.
    expect(posts, mockUsers);
  });
}
