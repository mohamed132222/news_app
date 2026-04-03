import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../core/provider/settings/settings_provider.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  late WebViewController webViewController;

  WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The full Articles view',
          style: provider.isDark()
              ? TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.white,
                )
              : TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black,
                ),
        ),
      ),
      body: WebViewWidget(controller: widget.webViewController),
    );
  }
}
