import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/full_page_update/copy_link_android_button.dart';

class UpdatePageAndroidScaffold extends StatelessWidget {
  const UpdatePageAndroidScaffold({
    required this.link,
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);
  final String title;
  final String link;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [ CopyLinkAndroidButton(link) ],
      ),
      body: body,
    );
  }
}
