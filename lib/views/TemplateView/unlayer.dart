import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class UnLayerEditor extends StatefulWidget {
  static const route = '/template-editor';

  const UnLayerEditor({
    super.key,
  });

  @override
  UnLayerEditorState createState() => UnLayerEditorState();
}

class UnLayerEditorState extends State<UnLayerEditor> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://react-email-editor-ce42a.web.app/'),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
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
