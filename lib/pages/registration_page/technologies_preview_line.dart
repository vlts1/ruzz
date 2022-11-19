import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ruzz/local_db/supported_technologies.dart';

class TechnologiesPreviewLine extends StatefulWidget {
  const TechnologiesPreviewLine({Key? key}) : super(key: key);

  @override
  _TechnologiesPreviewLineState createState() => _TechnologiesPreviewLineState();
}

class _TechnologiesPreviewLineState extends State<TechnologiesPreviewLine> {
  ScrollController _controller = ScrollController();

  final appendableLogos = SupportedTechnologies.technologiesToLogos.values.toList();
  List<String> startLogos = [];

  bool currentCycleDidAppend = false;

  @override
  void initState() {
    startLogos.addAll(appendableLogos);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { startScroll(); });

    _controller.addListener(
      () {
        if (_controller.position.pixels > _controller.position.maxScrollExtent * 0.90) {
          if (currentCycleDidAppend == false) {
            startLogos.addAll(appendableLogos);
            currentCycleDidAppend = true;
          }
        }

        if (_controller.position.pixels == _controller.position.maxScrollExtent) {
          setState(() { currentCycleDidAppend = false; });
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) { continueScroll(); },
          );
        }
      },
    );
    super.initState();
  }

  void startScroll() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 5),
      curve: Curves.linear,
    );
  }

  void continueScroll() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 15),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    debugPrint('preview line stopped');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: startLogos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: MediaQuery.of(context).platformBrightness == Brightness.light 
                        ? Color.fromARGB(255, 245, 245, 245) 
                        : Color.fromARGB(255, 48, 48, 48),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      width:  40,
                      child: SvgPicture.asset(startLogos[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}