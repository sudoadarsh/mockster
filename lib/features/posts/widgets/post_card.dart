import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:mockster/extensions/context_extensions.dart";
import "../../../config/constants/gap_constants.dart";
import "../../../config/constants/icon_constants.dart";
import "../../../config/router/route_constants.dart";
import "../domain/entities/post_entity.dart";
import "../domain/entities/user_entity.dart";
import "post_card_header.dart";

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post, this.user});

  /// The current post.
  final PostEntity post;

  /// The current user.
  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostCardHeader(user: user),
        GapConstants.px10,

        // The title.
        Text(
          post.title ?? "",
          style: context.text.titleLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        // The body.
        Text(post.body ?? "", maxLines: 3),

        // The comment button.
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: () {},
              label: const Text("Save"),
              icon: IconConstants.save,
            ),
            TextButton.icon(
              onPressed: () => _pushToComments(context),
              label: const Text("Comments"),
              icon: IconConstants.comment,
            ),
          ],
        ),
      ],
    );
  }

  // ----------- Private methods. -----------

  /// Push to comments page.
  void _pushToComments(final BuildContext context) {
    return context.go(
      "${RouteConstants.home}${RouteConstants.comments}?postId=${post.postId}",
    );
  }
}
