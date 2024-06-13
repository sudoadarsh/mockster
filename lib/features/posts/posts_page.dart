import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mockster/features/posts/domain/entities/post_entity.dart";
import "package:mockster/features/posts/domain/entities/user_entity.dart";
import "package:mockster/features/posts/widgets/post_card.dart";

import "../../common/widgets/root_scaffold.dart";
import "../../core/dependency_injector.dart";
import "bloc/posts_bloc.dart";

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  /// The [PostsBloc].
  late final PostsBloc postsBloc;

  @override
  void initState() {
    postsBloc = DependencyInjector().accessLazy<PostsBloc>();
    postsBloc.add(FetchPostsEvent());
    postsBloc.add(FetchUsersEvent());
    super.initState();
  }

  @override
  void dispose() {
    postsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listener: (_, final PostsState state) {},
        builder: (_, final PostsState state) {
          if (state is FetchingPostsState) {
            return const Center(child: CircularProgressIndicator());
          }
          // Handle error state later.
          return ListView.separated(
            itemCount: postsBloc.posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (_, final int index) {
              // The current post.
              final PostEntity post = postsBloc.posts[index];
              // The required user.
              final UserEntity? user = postsBloc.users[post.userId];
              return PostCard(post: post, user: user);
            },
          );
        },
      ),
    );
  }
}
