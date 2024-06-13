import "package:flutter/material.dart";

import "../../../config/constants/gap_constants.dart";
import "../domain/entities/user_entity.dart";

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({super.key, this.user});

  /// The current user.
  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Row(
      children: [
        const CircleAvatar(),
        GapConstants.px20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user?.name ?? "", style: textStyle),
            Text(user?.email ?? ""),
          ],
        ),
      ],
    );
  }
}
