import "package:flutter/material.dart";
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
    super.initState();
  }

  @override
  void dispose() {
    postsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
