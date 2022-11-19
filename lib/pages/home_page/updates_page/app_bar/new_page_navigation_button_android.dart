import 'package:flutter/material.dart';

class NewPageNavigationButtonAndroid extends StatelessWidget {
  const NewPageNavigationButtonAndroid({
    required this.destination,
    required this.icon,
    Key? key,
  }) : super(key: key);
  
  final String destination;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: 24,
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushNamed(context, destination);
      },
    );
  }
}
