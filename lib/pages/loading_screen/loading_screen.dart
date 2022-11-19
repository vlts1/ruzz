import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/page_background_color.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  final pageBackgroundColor = PageBackgroundColor();
  late AnimationController animationController;
  late Animation colorTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )
    ..forward()
    ..addListener(() {
      setState(() {
        if (animationController.value == 1.0) {
          animationController.reverse();
          debugPrint('LoadingScreen animation: ' + animationController.value.toString());
        }
        if (animationController.value == 0.0) {
          animationController.forward();
          debugPrint('LoadingScreen animation: ' + animationController.value.toString());
        }
      });
    });

    colorTween = ColorTween(
      begin: Colors.grey  .withOpacity(0.5), 
      end:   Colors.orange.withOpacity(0.9),
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: colorTween.value,
                spreadRadius: 2,
                blurRadius: 18,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            'images/bee-logo-alternative.png',
            width:  150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
