import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/full_page_update/copy_link_ios_button.dart';

class UpdatePageIosScaffold extends StatelessWidget {
  const UpdatePageIosScaffold({
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: CopyLinkIosButton(link),
      ),
      child: body,
    );
  }
}
