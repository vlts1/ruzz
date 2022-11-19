import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/full_page_update/scaffolds/update_page_scaffold.dart';

class FullPageUpdate extends StatefulWidget {
  const FullPageUpdate({Key? key}) : super(key: key);
  static const route = '/full_page_update';
  @override
  State<FullPageUpdate> createState() => _FullPageUpdateState();
}

class _FullPageUpdateState extends State<FullPageUpdate> {
  late String link;
  late String title;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    title = args.first;
    link  = args[1];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return UpdatePageScaffold(title: title, link: link);
  }
}
