import 'package:flutter/cupertino.dart';

class ConversationPageCupertinoScaffold extends StatelessWidget {
  const ConversationPageCupertinoScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Conversations'),
        previousPageTitle: 'Updates',
      ),
      child: body,
    );
  }
}
