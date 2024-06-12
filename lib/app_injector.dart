import 'core/dependency_injector.dart';
import 'features/posts/bloc/posts_bloc.dart';
import 'features/posts/data/post_repository_concrete.dart';
import 'features/posts/data/source/post_remote_source.dart';

class AppInjector {
  AppInjector() {
    final DependencyInjector di = DependencyInjector();

    // Inject all the dependency.
    di.registerLazy(() => PostRemoteSource());
    di.registerLazy(
      () => PostRepositoryConcrete(source: di.accessLazy<PostRemoteSource>()),
    );
    di.registerLazy(() => PostsBloc(di.accessLazy<PostRepositoryConcrete>()));
  }
}
