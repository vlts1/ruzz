import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:ruzz/pages/conversations_page/scaffolds/conversations_page_cupertino_scaffold.dart';
import 'package:ruzz/pages/conversations_page/scaffolds/conversations_page_material_scaffold.dart';

class ConversationsPageScaffold extends StatelessWidget {
  const ConversationsPageScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? ConversationPageCupertinoScaffold(body: body)
        : ConversationsPageMaterialScaffold(body: body);
  }
}
