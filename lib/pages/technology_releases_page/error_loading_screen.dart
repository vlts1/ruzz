import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';

class ErrorLoadingScreen extends StatelessWidget {
  const ErrorLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Center(
            child: Text(
              "Error loading data.\nPlease try again later.",
              textAlign: TextAlign.center,
              style: TextStyle(color: SystemTextColor.getColor(context)),
            ),
          ),
        ],
      ),
    );
  }
}
