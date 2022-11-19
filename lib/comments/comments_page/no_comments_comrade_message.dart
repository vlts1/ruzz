import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../themes/system_text_color.dart';

class NoCommentsComradeMessage extends StatelessWidget {
  const NoCommentsComradeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
      child: Center(
        child: Text(
          "Be first to comment!",
          style: TextStyle(color: SystemTextColor.getColor(context)),
        ),
      ),
    );
  }
}
