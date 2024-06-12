import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockster/features/posts/bloc/posts_bloc.dart';
import 'package:mockster/features/posts/data/models/post_model.dart';
import 'package:mockster/features/posts/domain/entities/post_entity.dart';

import 'posts_test_helper.mocks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String json = await rootBundle.loadString("mock/mock_post.json");
  final List decodedJson = jsonDecode(json);
  final List<PostEntity> posts = [PostModel.fromJson(decodedJson[0])];

  late final MockPostRepositoryConcrete postRepository;
  late final PostsBloc postsBloc;

  // Code to run before any test.
  setUpAll(() {
    postRepository = MockPostRepositoryConcrete();
    postsBloc = PostsBloc(postRepository);
  });

  blocTest(
    "Fetching the posts",
    build: () {
      when(postRepository.fetchPosts()).thenAnswer((_) async => posts);
      return postsBloc;
    },
    act: (final PostsBloc bloc) => bloc.add(FetchPostsEvent()),
    expect: () => [FetchingPostsState(), PostsFetchedState()],
  );
}
