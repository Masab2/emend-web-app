import 'dart:developer';
import 'dart:html' as html;

import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static Future<void> launchInAppWebView({
    required String url,
    bool enableJavaScript = true,
    bool enableDomStorage = true,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          webOnlyWindowName: 'Email Editor',
          browserConfiguration: const BrowserConfiguration(
            showTitle: true,
          ),
          mode: LaunchMode.inAppBrowserView,
          webViewConfiguration: WebViewConfiguration(
            enableJavaScript: enableJavaScript,
            enableDomStorage: enableDomStorage,
          ),
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      log('Error launching URL: $e');
      // You might want to rethrow or handle the error differently
      rethrow;
    }
  }

  static void launchInSameTab() {
    String url =
        'https://react-email-editor-ce42a.web.app/${templateCode.value}/?token=${token.value}';
    html.window.location.href = url;
  }
}
