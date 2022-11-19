import 'package:flutter/cupertino.dart';

class ImageUploadError extends CupertinoAlertDialog {
  const ImageUploadError(this.context, {Key? key}) : super(key: key);
  final BuildContext context;

  @override
  Widget? get title => const Text("Could not receive image");

  @override
  Widget? get content => const Text("Please try again later.");

  @override
  List<Widget> get actions => <Widget>[
        CupertinoDialogAction(
          child: const Text("Ok"),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ];
}
