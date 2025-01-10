import 'dart:developer';

import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/TemplateController/template_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class TemplateEditor extends StatefulWidget {
  const TemplateEditor({
    super.key,
  });

  @override
  TemplateEditorState createState() => TemplateEditorState();
}

class TemplateEditorState extends State<TemplateEditor> {
  late InAppWebViewController webViewController;
  TemplateController controller = Get.put(TemplateController());
  @override
  Widget build(BuildContext context) {
    log("https://react-email-editor-ce42a.web.app${templateCode.value}&token=${AppUrl.token}");
    
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage(ImageAsset.logo),
        ),
        centerTitle: true,
        title: Text(
          "Email Editor",
          style: TextStyle(
              fontSize: context.mh * 0.024, fontWeight: FontWeight.bold),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
              'https://react-email-editor-ce42a.web.app${templateCode.value}token=${AppUrl.token}'),
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
