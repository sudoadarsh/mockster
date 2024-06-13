import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mockster/config/constants/gap_constants.dart";
import "package:mockster/extensions/context_extensions.dart";

import "../../common/widgets/root_scaffold.dart";
import "../../core/dependency_injector.dart";
import "bloc/comment_bloc.dart";
import "domain/comment_entity.dart";

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, required this.postId});

  /// The post id.
  final String? postId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  /// The [CommentBloc].
  late final CommentBloc commentBloc;

  @override
  void initState() {
    commentBloc = DependencyInjector().accessLazy<CommentBloc>();
    if (widget.postId != null) {
      commentBloc.add(FetchCommentEvent(widget.postId!));
    }
    super.initState();
  }

  @override
  void dispose() {
    commentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      body: BlocConsumer<CommentBloc, CommentState>(
        bloc: commentBloc,
        listener: (_, final CommentState state) {
          // TODO: implement listener
        },
        builder: (_, final CommentState state) {
          if (state is FetchingCommentState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: commentBloc.comments.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (_, final int index) {
              // The current comment.
              final CommentEntity entity = commentBloc.comments[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.comment ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GapConstants.px10,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("- ${entity.commentator}", style: _commentator),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  // --------------- Private methods. ---------------

  /// Get the text style for commentator.
  TextStyle? get _commentator {
    return context.text.bodySmall?.copyWith(fontWeight: FontWeight.bold);
  }
}
