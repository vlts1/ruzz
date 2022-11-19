import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/likes_count_number.dart';

class LikesCountBody extends StatelessWidget {
  const LikesCountBody({Key? key, required this.icon, required this.count}) : super(key: key);
  final Widget icon;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 6, left: 15, right: 1),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 6),
          LikesCountNumber(
            likesCount: count,
          ),
        ],
      ),
    );
  }
}
