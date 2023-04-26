// ignore_for_file: unused_catch_clause, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_windows/webview_windows.dart';

class MieclaimController extends GetxController {
  // ignore: todo
  //TODO: Implement MieclaimController
  final navigatorKey = GlobalKey<NavigatorState>();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // getwebview
  final webViewcontroller = WebviewController();
  final textController = TextEditingController();
  bool isWebviewSuspended = false;

  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory
    // and/or a custom browser executable directory
    // and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    try {
      await webViewcontroller.initialize();
      webViewcontroller.url.listen((url) {
        textController.text = url;
      });

      await webViewcontroller.setBackgroundColor(Colors.transparent);
      await webViewcontroller
          .setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      await webViewcontroller.loadUrl('https://flutter.dev');
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {});
    }
  }

  Future<WebviewPermissionDecision> onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }
}
