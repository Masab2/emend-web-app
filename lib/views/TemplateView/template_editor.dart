import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TemplateEditor extends StatefulWidget {
  const TemplateEditor({
    super.key,
  });

  @override
  TemplateEditorState createState() => TemplateEditorState();
}

class TemplateEditorState extends State<TemplateEditor> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://react-email-editor-ce42a.web.app/'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          debugPrint("Page started loading: $url");
        },
        onLoadStop: (controller, url) async {
          debugPrint("Page finished loading: $url");
        },
        onProgressChanged: (controller, progress) {
          debugPrint("Loading progress: $progress%");
        },
      ),
    );
  }
}
