import 'package:go_router/go_router.dart';

import '../../features/comments/comments_page.dart';
import '../../features/posts/posts_page.dart';
import 'route_constants.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RouteConstants.home,
        builder: (_, __) => const PostsPage(),
        routes: [
          GoRoute(
            path: RouteConstants.comments,
            builder: (_, final GoRouterState state) {
              final String? postId = state.uri.queryParameters["postId"];
              return CommentsPage(postId: postId);
            },
          ),
        ],
      ),
    ],
  );
}
