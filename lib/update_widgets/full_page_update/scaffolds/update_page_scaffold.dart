import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/full_page_update/scaffolds/update_page_android_scaffold.dart';
import 'package:ruzz/update_widgets/full_page_update/scaffolds/update_page_ios_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../themes/colors/page_background_color.dart';

class UpdatePageScaffold extends StatelessWidget {
  UpdatePageScaffold({required this.link, required this.title, super.key});
  final String link;
  final String title;
  final cookieManager = CookieManager();

  late final backgroundColor = PageBackgroundColor();
  void tryDisableCookies(WebViewController controller) {
    controller.clearCache();
    cookieManager.clearCookies();
  }

  @override
  Widget build(BuildContext context) {
    late final _bodyView = SafeArea(
      top:    true,
      bottom: false,
      left:   false,
      right:  false,
      child: WebView(
        onWebViewCreated: tryDisableCookies,
        onPageStarted: (url) {
          cookieManager.clearCookies();
        },
        onPageFinished: (url) {
          cookieManager.clearCookies();
        },
        onProgress: (progress) {
          cookieManager.clearCookies();
        },
        initialUrl: link,
        zoomEnabled: false,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    cookieManager.clearCookies();
    return Platform.isIOS 
        ? UpdatePageIosScaffold    (link: link, title: title, body: _bodyView)
        : UpdatePageAndroidScaffold(link: link, title: title, body: _bodyView);
  }
}
