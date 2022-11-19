import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';

class HeaderBoxVerticalPair extends StatelessWidget {
  const HeaderBoxVerticalPair(this.topChild, this.bottomChild, {super.key});
  final Widget topChild;
  final Widget bottomChild;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(child: topChild, height: TechnologyLogo.size),
          bottomChild,
        ],
      ),
    );
  }
}
