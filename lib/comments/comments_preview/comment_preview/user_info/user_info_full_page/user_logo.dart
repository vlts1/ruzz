import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/circular_image_decoration.dart';

class UserLogo extends StatelessWidget {
  const UserLogo({required this.logo, this.witdth = 65, this.height = 65, Key? key})
      : super(key: key);
  final Image logo;
  final double witdth;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdth,
      height: height,
      decoration: CircularImageDecoration(logo),
    );
  }
}
