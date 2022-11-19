import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    }
    return SizedBox(
      height: 10,
      width: 10,
      //* Won't work without center. See
      //* (https://stackoverflow.com/questions/51901379/how-to-set-size-to-circularprogressindicator)
      child: Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
    );
  }
}
