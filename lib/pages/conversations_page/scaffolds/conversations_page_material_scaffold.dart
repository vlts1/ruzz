import 'package:flutter/material.dart';

class ConversationsPageMaterialScaffold extends StatelessWidget {
  const ConversationsPageMaterialScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversations'), centerTitle: true),
      body: body,
    );
  }
}
