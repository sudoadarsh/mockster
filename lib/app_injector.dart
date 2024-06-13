import 'package:mockster/features/comments/bloc/comment_bloc.dart';
import 'package:mockster/features/comments/data/comment_repo_concrete.dart';
import 'package:mockster/features/comments/domain/comment_repository.dart';

import 'core/dependency_injector.dart';
import 'features/comments/data/source/comment_remote_source.dart';
import 'features/comments/data/source/comment_source.dart';
import 'features/posts/bloc/posts_bloc.dart';
import 'features/posts/data/post_repository_concrete.dart';
import 'features/posts/data/source/post_remote_source.dart';
import 'features/posts/data/source/post_source.dart';
import 'features/posts/domain/post_repository.dart';

class AppInjector {
  AppInjector() {
    final DependencyInjector di = DependencyInjector();

    // Inject all the sources.
    di.registerLazy<PostSource>(() => PostRemoteSource());
    di.registerLazy<CommentSource>(() => CommentRemoteSource());

    // Inject all the repositories.
    di.registerLazy<PostRepository>(
      () => PostRepositoryConcrete(source: di.accessLazy<PostSource>()),
    );
    di.registerLazy<CommentRepository>(
      () => CommentRepoConcrete(source: di.accessLazy<CommentSource>()),
    );

    // Inject all the blocs.
    di.registerLazy(() => PostsBloc(di.accessLazy<PostRepository>()));
    di.registerLazy(() => CommentBloc(di.accessLazy<CommentRepository>()));
  }
}
