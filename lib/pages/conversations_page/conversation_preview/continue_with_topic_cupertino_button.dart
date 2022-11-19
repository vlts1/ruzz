import 'package:flutter/cupertino.dart';

class ContinueWithTopicCupertinoButton extends StatelessWidget {
  ContinueWithTopicCupertinoButton(this.onClick, {super.key});
  final void Function() onClick;

  late final _buttonBody = Container(
    height: 35,
    decoration: BoxDecoration(
      border: Border.all(color: CupertinoColors.systemBlue, width: 0.5),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Center(child: Text('Continue')),
  );
  
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onClick,
      child: _buttonBody,
    );
  }
}
