// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manulife/constant/colors.dart';
import 'package:manulife/constant/styles.dart';
import 'dart:async';

import 'package:webview_windows/webview_windows.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MiposView extends StatefulWidget {
  const MiposView({Key? key}) : super(key: key);

  @override
  State<MiposView> createState() => _MiposView();
}

class _MiposView extends State<MiposView> {
  final _controller = WebviewController();
  final _textController = TextEditingController();
  bool _isWebviewSuspended = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory
    // and/or a custom browser executable directory
    // and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    try {
      await _controller.initialize();
      _controller.url.listen((url) {
        _textController.text = url;
      });

      await _controller.setBackgroundColor(Colors.transparent);
      await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      await _controller.loadUrl('https://tools.manulife.com/id/mipos/login');

      if (!mounted) return;
      setState(() {});
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Error'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Code: ${e.code}'),
                      Text('Message: ${e.message}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Continue'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      });
    }
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return CircularProgressIndicator();
      // return const Text(
      //   'Not Initialized',
      //   style: TextStyle(
      //     fontSize: 24.0,
      //     fontWeight: FontWeight.w900,
      //   ),
      // );
    } else {
      return Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
                child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Webview(
                          _controller,
                          permissionRequested: _onPermissionRequested,
                        ),
                        Positioned(
                          top: 65,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColor.greenColor,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                color: AppColor.whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.greenColor,
                                    ),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColor.whiteColor,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "back".toUpperCase(),
                                    style: TextStyles.subtitle1
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                       
                        StreamBuilder<LoadingState>(
                            stream: _controller.loadingState,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data == LoadingState.loading) {
                                return LinearProgressIndicator();
                              } else {
                                return SizedBox();
                              }
                            }),
                      ],
                    ))),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: compositeView(),
      ),
    );
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
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
